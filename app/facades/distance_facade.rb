class DistanceFacade

  def initialize(user_lat, user_long, shelter_lat, shelter_long)
    @user_lat = user_lat
    @user_long = user_long
    @shelter_lat = shelter_lat
    @shelter_long = shelter_long
  end

  def get_distance
    user_ll = Geokit::LatLng.new(@user_lat,@user_long)
    shelter_ll = Geokit::LatLng.new(@shelter_lat,@shelter_long)
    mileage = user_ll.distance_from(shelter_ll,:units => :miles).round
    return mileage
  end
end
