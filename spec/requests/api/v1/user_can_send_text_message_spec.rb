require 'rails_helper'

RSpec.describe "Text endpoint" do
  it "POST /text" do
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
      "recipient_phone": "5038397336",
      "pet_id": "43989015",
      "pet_name": "luigi",
      "shelter_name": "Animal House"
    }

    post "/api/v1/texts", params: data
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)["success"]).to eq("Text Sent!")
  end

  it "throws error if incorrect api token" do
    user_data = {
      "first_name": "The Greatest",
      "last_name": "Guy",
      "email": "ggg@gmail.com",
      "password": "abc123doremi",
      "password_confirmation": "abc123doremi"
    }

    user = User.create!(user_data)

    data = {
      "api_token": "invalidAPIToken",
      "recipient_phone": "5038397336",
      "pet_id": "43989015",
      "pet_name": "luigi",
      "shelter_name": "Animal House"
    }

    post "/api/v1/texts", params: data
    expect(response.status).to eq(500)
    expect(JSON.parse(response.body)["error"]).to eq("This number is not currently verified with our Twilio Trial Account")
  end
end
