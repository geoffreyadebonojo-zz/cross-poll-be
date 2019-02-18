class Api::V1::TextsController < ApplicationController

  def create
    user = User.find_by(api_token: params[:api_token])
    twilio = TwilioFacade.new(user, params[:recipient_phone], params[:pic], params[:pet_name], params[:shelter_name])
    twilio.notify_friend
  end

end
