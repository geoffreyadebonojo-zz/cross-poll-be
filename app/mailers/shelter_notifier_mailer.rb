class ShelterNotifierMailer < ApplicationMailer
  def notify_shelter(user, shelter_email, pet_name, message)
    @user = user
    @shelter_email = shelter_email
    @pet_name = pet_name
    @message = message
    # @phone_number = phone_number unless nil
    mail(from: user.email, to: @shelter_email, subject: "Interested in #{@pet_name}")
  end
end
