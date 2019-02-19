class Api::V1::TextsController < ApplicationController

  def create
    user = User.find_by(api_token: params[:api_token])
    if user
      twilio = TwilioFacade.new(user, params[:recipient_phone], params[:pic], params[:pet_name], params[:shelter_name])
      twilio.notify_friend
      render :json => {:success => "Text Sent!"}.to_json, :status => 200
    else
      render :json => {:error => "This number is not currently verified with our Twilio Trial Account"}.to_json, :status => 500   #this doesnt work yet
    end
  end

end
