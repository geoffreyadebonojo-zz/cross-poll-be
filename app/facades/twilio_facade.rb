class TwilioFacade
  def initialize(user, recipient_phone, pet_id, pet_name, shelter_name)
    @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    # @user_first_name = user.first_name
    # @user_last_name = user.last_name
    @user_first_name = "Geoff"
    @user_last_name = "Adams"
    @recipient_phone = recipient_phone
    @pet_name = pet_name
    @pet_id = pet_id
    @shelter_name = shelter_name
    @shelter_url = GoogleService.new("get petfinder #{@pet_name}-#{@pet_id}").get_link
  end

  def notify_friend
    @client.messages.create(
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: @recipient_phone,
      body: message_friend)
  end

  def message_friend
    "Your friend, #{@user_first_name} #{@user_last_name} thinks that you and #{@pet_name} would be a great match! #{@pet_name} is currently located at #{@shelter_name}." + @shelter_url
  end

end
