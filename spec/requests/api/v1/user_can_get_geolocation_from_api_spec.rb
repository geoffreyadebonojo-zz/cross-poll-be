require 'rails_helper'

RSpec.describe "Geolocation Endpoint" do
  it "GET /location" do
    get "/api/v1/locations"
    expect(response.status).to eq(200)
    expect(response["zip_code"]).to be(nil)

  end
end
