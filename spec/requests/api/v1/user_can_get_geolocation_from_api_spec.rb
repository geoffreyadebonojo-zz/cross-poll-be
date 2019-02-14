require 'rails_helper'

RSpec.describe "Geolocation Endpoint" do
  it "GET /location" do
    get "/api/v1/locations"
    binding.pry
    expect(response.status).to eq(200)
    expect(response.keys[0]).to eq("zip_code")
    expect(response["keys"]).to_be a(String)
  end
end
