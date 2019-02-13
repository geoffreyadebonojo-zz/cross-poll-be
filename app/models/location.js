class Location{
  if (navigator.geolocation) {
    return [navigator.geolocation.position.coords.latitude, navigator.geolocation.position.coords.latitude]
  } else {
    return "Geolocation is not supported by this browser.";
  }
}
