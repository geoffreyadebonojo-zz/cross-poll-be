require 'rails_helper'

RSpec.describe "User login" do
  it "POST /user" do
    data = {
      "first_name": "The Greatest",
      "last_name": "Guy",
      "email": "ggg@gmail.com",
      "password": "abc123doremi",
      "password_confirmation": "abc123doremi"
    }

    post "/api/v1/users", params: data

    expect(response.status).to eq(201)
    token = JSON.parse(response.body)["data"]["attributes"]["api_token"]
    expect(token).to be_a(String)
  end
end
