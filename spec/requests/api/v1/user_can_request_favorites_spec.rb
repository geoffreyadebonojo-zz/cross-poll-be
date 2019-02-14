require 'rails_helper'

RSpec.describe "Favorites Endpoint" do
  xit "GET /favorites" do
    user_data = {
      "first_name": "The Greatest",
      "last_name": "Guy",
      "email": "ggg@gmail.com",
      "password": "abc123doremi",
      "password_confirmation": "abc123doremi"
    }

    user = User.create!(user_data)
    user.favorites.create!(id: 1)
    user.favorites.create!(id: 2)

    user_api_key = {
      "api_key": user.api_key
    }

    get "/api/v1/favorites", params: user_api_key
    expect(response.status).to eq(200)
    body = JSON.parse(response.body)["data"]
    expect(body.count).to eq(2)
  end

  xit "POST /favorites" do

  end

  xit "DELETE /favorites" do

  end
end
