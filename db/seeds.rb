require 'rest-client'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#
league_resp = RestClient.get("http://api.football-data.org/v1/competitions",
      headers:  { 'X-Auth-Token': '3a013399d10f4c4b97456f63b52027de' })
league_json = JSON.parse(league_resp)

league_json.each do |league|
  League.create(name: league["caption"], teams:[], api_id: league["id"] , league_abr:league["league"])
end

League.all.each do |league|
  teams_resp = RestClient.get("http://api.football-data.org/v1/competitions/#{league.api_id}/leagueTable", {
        headers:  { 'X-Auth-Token': '3a013399d10f4c4b97456f63b52027de' }
      })
  teams_json = JSON.parse(teams_resp)
  if !teams_json["error"]
    league_teams = teams_json["standing"].map do |team|
      Team.create(name: team["teamName"], position: team["position"], img: team["crestURI"], wins: team["wins"], losses: team["losses"], draws: team["draws"], points: team["points"], api_url: team["_links"]["team"]["href"])
    end
    league.teams = league_teams
  end
end


#
# premier_teams = RestClient.get("http://api.football-data.org/v1/competitions/445/leagueTable", {
#       headers:  { 'X-Auth-Token': '3a013399d10f4c4b97456f63b52027de' }
#     })
#
# premier_teams_json = JSON.parse(premier_teams)


# l = League.create(name: league_json["caption"], teams:[])


# premier_teams_json["standing"].each do |team|
#   Team.create(name: team["teamName"], position: team["position"], img: team["crestURI"], wins: team["wins"], losses: team["losses"], draws: team["draws"], points: team["points"], api_url: team["_links"]["team"]["href"])
# end
#
# l.teams = Team.all
