class Api::V1::FixturesController < ApplicationController


  def index
    @fixtures = Fixture.all()
    render json: @fixtures
  end

  def show
  end

  def create
    @fixture = Fixture.new(fixture_params)
    if @fixture.save
      render json: @fixture
    else
      render json: {errors: @fixture.errors.full_message}
    end

  end

  def update
  end

  def destroy
  end

  private

  def fixture_params(params)
    params.require(:fixture).permit(:home, :away, :home_score, :away_score, :date, :status)
  end


end
