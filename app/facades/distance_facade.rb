class DistanceFacade

  def initialize(location, shelter_lat, shelter_long)
    @location = LocationService.new(location)
    @shelter_lat = shelter_lat
    @shelter_long = shelter_long
  end

  def get_distance
    user_lat_long
    user_ll = Geokit::LatLng.new(40.260060,-75.231080)
    shelter_ll = Geokit::LatLng.new(@shelter_lat,@shelter_long)
    mileage = user_ll.distance_from(shelter_ll,:units => :miles).round
    return mileage
  end

  def user_lat_long
    @lat = @location.get_zip[10].first[1]
    @long = @location.get_zip[11].first[1]
  end

end
