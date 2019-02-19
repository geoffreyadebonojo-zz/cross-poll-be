class Api::V1::DistancesController < ApplicationController

  def index
    mileage = DistanceFacade.new(params[:user_lat], params[:user_long], params[:shelter_lat], params[:shelter_long]).get_distance
    if mileage.class == Integer
      render :json => {:distance => mileage}.to_json, :status => 200
    else
      render :json => {:error => "Mileage could not be calculated"}.to_json, :status => 400
  end

end
