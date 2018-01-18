# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


league_resp = fetch("http://api.football-data.org/v1/competitions/445", {
      headers:  { 'X-Auth-Token': '3a013399d10f4c4b97456f63b52027de' },
      type: 'GET',
      datatype: 'json'
    })

League.create(name: league_resp.caption)
