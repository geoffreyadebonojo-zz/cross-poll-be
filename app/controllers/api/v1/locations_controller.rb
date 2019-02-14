class Api::V1::LocationsController < ApplicationController

  def index
    location = request.location.ip
    zip_code = LocationService.new(location).get_zip[9].first[1]
    render :json => {:zip_code => zip_code}.to_json, :status => 200
  end

end
