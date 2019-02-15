require 'rails_helper'

RSpec.describe "Favorites Endpoint" do
  it "GET /favorites" do
    user_data = {
      "first_name": "The Greatest",
      "last_name": "Guy",
      "email": "ggg@gmail.com",
      "password": "abc123doremi",
      "password_confirmation": "abc123doremi"
    }

    user = User.create!(user_data)
    user.favorites.create!(favorite_id: 1)
    user.favorites.create!(favorite_id: 2)

    user_api_key = {
      "api_token": user.api_token
    }

    get "/api/v1/favorites", params: user_api_key
    expect(response.status).to eq(200)
    body = JSON.parse(response.body)["data"]
    expect(body.count).to eq(2)
  end

  it "GET throws an error if incorrect api token is given" do
    user_data = {
      "first_name": "The Greatest",
      "last_name": "Guy",
      "email": "ggg@gmail.com",
      "password": "abc123doremi",
      "password_confirmation": "abc123doremi"
    }

    user = User.create!(user_data)
    user.favorites.create!(favorite_id: 1)
    user.favorites.create!(favorite_id: 2)

    user_api_key = {
      "api_token": "notAvalidAPItoken"
    }

    get "/api/v1/favorites", params: user_api_key
    expect(response.status).to eq(404)
  end

  it "POST /favorites" do
    user_data = {
      "first_name": "The Greatest",
      "last_name": "Guy",
      "email": "ggg@gmail.com",
      "password": "abc123doremi",
      "password_confirmation": "abc123doremi"
    }

    user = User.create!(user_data)

    data = {
      "api_token": user.api_token,
      "favorite_id": 1
    }

    post "/api/v1/favorites", params: data
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)["message"]).to eq("Successfully added favorite with id 1")
  end

  it "POST throws an error if no api token is provided" do
    user_data = {
      "first_name": "The Greatest",
      "last_name": "Guy",
      "email": "ggg@gmail.com",
      "password": "abc123doremi",
      "password_confirmation": "abc123doremi"
    }

    user = User.create!(user_data)

    data = {
      "favorite_id": 1
    }

    post "/api/v1/favorites", params: data
    expect(response.status).to eq(404)
  end

  it "DELETE /favorites" do
    user_data = {
      "first_name": "The Greatest",
      "last_name": "Guy",
      "email": "ggg@gmail.com",
      "password": "abc123doremi",
      "password_confirmation": "abc123doremi"
    }

    user = User.create!(user_data)
    user.favorites.create!(favorite_id: 1)
    user.favorites.create!(favorite_id: 2)

    data = {
      "api_token": user.api_token,
      "favorite_id": 1
    }

    delete "/api/v1/favorites/1", params: data
    expect(response.status).to eq(200)
    body = JSON.parse(response.body)["data"]
    expect(body.count).to eq(1)
  end

  it "DELETE throws an error if no api token is provided" do
    user_data = {
      "first_name": "The Greatest",
      "last_name": "Guy",
      "email": "ggg@gmail.com",
      "password": "abc123doremi",
      "password_confirmation": "abc123doremi"
    }

    user = User.create!(user_data)

    data = {
      "favorite_id": 1
    }

    delete "/api/v1/favorites", params: data
    expect(response.status).to eq(404)
  end
end
