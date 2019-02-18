class TwilioFacade
  def initialize(user, recipient_phone, pic, pet_name)
    @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    @user_first_name = user.first_name
    @user_last_name = user.last_name
    @recipient_phone = recipient_phone
    @pic = pic
    @pet_name = pet_name
  end

  def notify_friend
    @client.messages.create(
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: @recipient_phone,
      body: message_friend)
  end

  def message_friend
    "Your friend, #{@user_first_name} #{@user_last_name} thinks that you and #{@pet_name} would be a great match! "
  end

end
