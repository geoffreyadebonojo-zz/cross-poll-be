require 'rails_helper'

RSpec.describe "Mailer endpoint" do
  it "POST /shelter_notifier" do
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
      "pet_name": "Fluphy",
      "shelter_email": "radpets@gmail.com",
      "message": "I'm so excited to get another lizard!"
    }

    post "/api/v1/shelter_notifier", params: data
    expect(response.status).to eq(204)
  end
end
