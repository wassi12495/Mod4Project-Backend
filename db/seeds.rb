require 'rest-client'
require 'json'
require 'football__data'
# Josh's key-- 4a9ace89a355471280f93cb35479661b
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


FootballData.configure do |config|
  config.api_key = "4a9ace89a355471280f93cb35479661b"
  config.api_version = 'v1'
  config.response_control = 'full'
end


league_resp = FootballData.fetch(:competitions)


league_resp.each do |league|
  if league["id"] == 445 || league["id"] ==449 || league["id"] ==450 || league["id"] ==452 || league["id"] ==455 ||league["id"] ==456
    League.create(name: league["caption"], teams:[], api_id: league["id"] , league_abr: league["league"])
  end
end

League.all.each do |league|
  teams_json = FootballData.fetch(:competitions, :leagueTable, id:league.api_id)
  if !teams_json["error"]

    league_teams = teams_json["standing"].map do |team|
      Team.create(name: team["teamName"], position: team["position"], img: team["crestURI"], wins: team["wins"], losses: team["losses"], draws: team["draws"], points: team["points"], api_url: team["_links"]["team"]["href"])
    end
    league.teams = league_teams
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
