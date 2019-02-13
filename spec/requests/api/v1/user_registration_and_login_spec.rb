require 'rails_helper'

RSpec.describe "User login" do
  it "POST /users" do
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

  it "throws error if password not confirmed" do
    data = {
      "first_name": "The Greatest",
      "last_name": "Guy",
      "email": "ggg@gmail.com",
      "password": "abc123doremi",
      "password_confirmation": "incomplete"
    }

    post "/api/v1/users", params: data

    expect(response.status).to eq(401)
  end

  it "throws error if no email is entered" do
    data = {
      "first_name": "The Greatest",
      "last_name": "Guy",
      "email": "",
      "password": "abc123doremi",
      "password_confirmation": "incomplete"
    }

    post "/api/v1/users", params: data

    expect(response.status).to eq(401)
  end

  it "throws error if email is already taken" do
    data = {
      "first_name": "John",
      "last_name": "Jackson",
      "email": "ggg@gmail.com",
      "password": "abc123doremi",
      "password_confirmation": "abc123doremi"
    }

    post "/api/v1/users", params: data

    expect(response.status).to eq(201)
    token = JSON.parse(response.body)["data"]["attributes"]["api_token"]
    expect(token).to be_a(String)

    data = {
      "first_name": "Jack",
      "last_name": "Johnson",
      "email": "ggg@gmail.com",
      "password": "abc123doremi",
      "password_confirmation": "abc123doremi"
    }

    post "/api/v1/users", params: data

    expect(response.status).to eq(401)
  end

  it "POST /sessions" do
    data = {
    "first_name": "The Greatest",
    "last_name": "Guy",
    "email": "awesomesauce@gmail.com",
    "password": "abc123doremi",
    }
    user = User.create!(data)

    post "/api/v1/sessions", params: data

    expect(response.status).to eq(200)
    token = JSON.parse(response.body)["data"]["attributes"]["api_token"]
    expect(token).to be_a(String)
  end

  it "throws error if user tries to login with wrong password" do
    user_data = {
      "first_name": "The Greatest",
      "last_name": "Guy",
      "email": "awesomesauce@gmail.com",
      "password": "abc123doremi",
    }
    user = User.create!(user_data)
    bad_data = {
      "email": "awesomesauce@gmail.com",
      "password": "incorrect"
    }
    post "/api/v1/sessions", params: bad_data

    expect(response.status).to eq(404)
    body = JSON.parse(response.body)
    expect(body["key"]).to be_nil
    expect(body["error"]).to eq("Check email and password, we can't seem to find this account")
  end

end
