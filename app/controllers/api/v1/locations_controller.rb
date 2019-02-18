class Api::V1::LocationsController < ApplicationController

  def index
    location = LocationService.new(request.location.ip)
    zip_code = location.get_zip[9].first[1]
    latitude = location.get_zip[10].first[1]
    longitude = location.get_zip[11].first[1]
    render :json => {:zip_code => zip_code, :latitude => latitude, :longitude => longitude}.to_json, :status => 200
  end

end
