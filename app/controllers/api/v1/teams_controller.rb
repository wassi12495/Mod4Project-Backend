class Api::V1::TeamsController < ApplicationController


    def index
      @teams = Team.all()
      render json: @teams
    end

    def show
    end

    def create
      @team = League.new(team_params)
      if @team.save
        render json: @team
      else
        render json: {error: "Invalid Team"}
      end

    end

    def update
    end

    def destroy
    end

    private

    def team_params(params)
      params.require(:team).permit(:name, :position, :img, :wins, :draws, :losses, :points, :api_url)
    end

end
