class Api::V1::DistancesController < ApplicationController

  def index
    location = request.location.ip
    mileage = DistanceFacade.new(location, params[:lat], params[:long]).get_distance
    render :json => {:distance => "#{mileage} miles away"}.to_json, :status => 200
  end

end
