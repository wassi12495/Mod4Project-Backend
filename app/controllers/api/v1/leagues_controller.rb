class Api::V1::LeaguesController < ApplicationController


  def index
    @leagues = League.all()
    render json: @leagues
  end

  def show
  end

  def create
    @league = League.new(league_params)
    if @league.save
      render json: @league
    else
      render json: {errors: @league.errors.full_message}
    end

  end

  def update
  end

  def destroy
  end

  private

  def league_params(params)
    params.require(:league).permit(:name)
  end


end
