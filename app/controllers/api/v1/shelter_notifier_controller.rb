require 'kickbox'
class Api::V1::ShelterNotifierController < ApplicationController

  def create
    @user = User.find_by(api_token: params[:api_token])
    @pet_name = params[:pet_name]
    @shelter_email = params[:shelter_email]
    @message = params[:message]

    response = ShelterNotifierMailer.notify_shelter(@user, @shelter_email, @pet_name, @message).deliver_now
    if verify_email.body["result"] == "deliverable" && response.class == Mail::Message
      render :json => {:success => "Email Sent!"}.to_json, :status => 204
    else
      render :json => {:error => "This email cannot be sent at this time. The Shelters email address may no longer be active."}.to_json, :status => 400
    end
  end

  private

  def verify_email
    client   = Kickbox::Client.new(ENV['KICKBOX_API'])
    kickbox  = client.kickbox()
    response = kickbox.verify(params[:shelter_email])
  end

end
