class Api::V1::FavoritesController < ApplicationController


  def create_team
    user = User.find(params[:user])
    team = Team.find_by(name: params[:team][:name])
    FavoriteTeam.create(user_id: user.id, team_id: team.id)
    render json: {user_id: user.id, team_id: team.id }

  end


  def create_league
    user = User.find(params[:user])
    league = League.find_by(name: params[:league][:name])


    FavoriteLeague.create(user_id: user.id, league_id: league.id)
    render json: {user_id: user.id, league_id: league.id}


  end
end
