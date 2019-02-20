require 'rails_helper'

RSpec.describe "Distance endpoint" do
  it "sends mileage when GET /distance is successful" do
    data = {
      "user_lat": 39.734,
      "user_long": -105.0259,
      "shelter_lat": 40.618830,
      "shelter_long": -104.865110
    }

    get "/api/v1/distances", params: data
    expect(response.status).to eq(200)
  end
  it "sends error when GET /distance is unsuccessful" do
    data = {
      "user_long": -105.0259,
      "shelter_lat": 40.618830,
      "shelter_long": -104.865110
    }

    get "/api/v1/distances", params: data
    expect(response.status).to eq(200)
  end

end
