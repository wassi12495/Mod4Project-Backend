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

<<<<<<< HEAD
#
league_resp = RestClient.get("http://api.football-data.org/v1/competitions",{
  headers:  { 'X-Auth-Token': '3a013399d10f4c4b97456f63b52027de' }
})
league_json = JSON.parse(league_resp)
=======
FootballData.configure do |config|
  config.api_key = "4a9ace89a355471280f93cb35479661b"
  config.api_version = 'v1'
  config.response_control = 'full'
end


league_resp = FootballData.fetch(:competitions)
# league_json = JSON.parse(league_resp)
>>>>>>> 2b3d80a187d1621e63fec71009b0947edabe914b

league_resp.each do |league|
  if league["id"] == 445 || league["id"] ==449 || league["id"] ==450 || league["id"] ==452 || league["id"] ==455 ||league["id"] ==456
    League.create(name: league["caption"], teams:[], api_id: league["id"] , league_abr:league["league"])
  end
end
#
# champtions = League.find_by(api_id: 464)
# australia = League.find_by(api_id: 466)
# League.destroy(champtions)
# League.destroy(australia)

<<<<<<< HEAD
# League.all.each do |league|
#   teams_resp = RestClient.get("http://api.football-data.org/v1/competitions/#{league.api_id}/leagueTable", {
#         headers:  { 'X-Auth-Token': '3a013399d10f4c4b97456f63b52027de' }
#       })
#   teams_json = JSON.parse(teams_resp)
#   if !teams_json["error"]
#     league_teams = teams_json["standing"].map do |team|
#       Team.create(name: team["teamName"], position: team["position"], img: team["crestURI"], wins: team["wins"], losses: team["losses"], draws: team["draws"], points: team["points"], api_url: team["_links"]["team"]["href"])
#     end
#     league.teams = league_teams
#   end
# end
=======
League.all.each do |league|
  teams_json = FootballData.fetch(:competitions, :leagueTable, id:league.api_id)
  if !teams_json["error"]

    league_teams = teams_json["standing"].map do |team|
      Team.create(name: team["teamName"], position: team["position"], img: team["crestURI"], wins: team["wins"], losses: team["losses"], draws: team["draws"], points: team["points"], api_url: team["_links"]["team"]["href"])
    end
    league.teams = league_teams
  end
end
>>>>>>> 2b3d80a187d1621e63fec71009b0947edabe914b


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
