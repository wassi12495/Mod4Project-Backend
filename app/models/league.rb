require 'rest-client'
require 'json'
require 'football__data'

class League < ApplicationRecord
  has_many :league_teams
  has_many :teams, through: :league_teams
  has_many :league_fixtures
  has_many :fixtures, through: :league_fixtures


  def self.fetch_api
    FootballData.configure do |config|
      config.api_key = "4a9ace89a355471280f93cb35479661b"
      config.api_version = 'v1'
      config.response_control = 'full'
    end


    league_resp = FootballData.fetch(:competitions)


    league_resp.each do |league|
      if league["id"] == 445 || league["id"] == 449 || league["id"] == 450 || league["id"] == 452 || league["id"] == 455 ||league["id"] == 456
        League.create(name: league["caption"], teams:[], fixtures:[], api_id: league["id"] , league_abr: league["league"])
      end
    end

    League.all.each do |league|
      teams_json = FootballData.fetch(:competitions, :leagueTable, id:league.api_id)
      if !teams_json["error"]

        league_teams = teams_json["standing"].map do |team|
          Team.create(name: team["teamName"], position: team["position"], img: team["crestURI"], wins: team["wins"], losses: team["losses"], draws: team["draws"], points: team["points"], api_url: team["_links"]["team"]["href"], fixtures: [])
        end
        league.teams = league_teams

      end

    end

    League.all.each do |league|
      fixtures_json = FootballData.fetch(:competitions, :fixtures, id: league.api_id)
      fixtures = fixtures_json["fixtures"].map do |game|
        Fixture.create(home: game["homeTeamName"], away: game["awayTeamName"], home_score: game["result"]["goalsHomeTeam"], away_score: game["result"]["goalsAwayTeam"], date: game["date"], status: game["status"])
      end
      league.fixtures = fixtures
      league.save
    end

    League.all.each do |league|

      league.teams.each do |team|

        league.fixtures.each do |game|
          if team.name == game.home || team.name == game.away
            team.fixtures.push(game)
            team.save
          end
        end
      end
    end

    league_logos = [{:league_abr => "PL", :img  => "https://goo.gl/sRzbsy"},
    {:league_abr => "DED", :img => "https://goo.gl/RouvRN"},
    {:league_abr => "FL1", :img => "https://goo.gl/jcGJez"},
    {:league_abr => "BL1", :img => "https://goo.gl/jBgj8w"},
    {:league_abr => "PD", :img => "https://goo.gl/1p1saH"},
    {:league_abr => "SA", :img => "https://goo.gl/xCdm53"}]

    league_logos.each do |hash|
      league = League.find_by(:league_abr == hash[:league_abr])
      league.img = hash[:img]
      league.save
    end

    team_logos = [{:id => 59, :img => "https://goo.gl/L4C8qc"},
    {:id => 73, :img => "https://goo.gl/cyp7aD"},
    {:id => 112, :img => "https://goo.gl/wWhmBk"},
    {:id => 116, :img => "https://goo.gl/X1oKjw"}]

    team_logos.each do |hash|
      team = Team.find(hash[:id])
      team.img
      team.img = hash[:img]
      team.save
    end
  end
end
