class Api::V1::ShelterNotifierController < ApplicationController

  def create
    @user = User.find_by(api_token: params[:api_token])
    @pet_name = params[:pet_name]
    @shelter_email = params[:shelter_email]
    @message = params[:message]
    # @phone_number = param[:phone_number] if params[:phone_number]
    ShelterNotifierMailer.notify_shelter(@user, @shelter_email, @pet_name, @message).deliver_now
  end

end
