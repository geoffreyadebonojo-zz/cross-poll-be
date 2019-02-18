class Api::V1::DistancesController < ApplicationController

  def index
    mileage = DistanceFacade.new(params[:user_lat], params[:user_long], params[:shelter_lat], params[:shelter_long]).get_distance
    render :json => {:distance => mileage}.to_json, :status => 200
  end

end
