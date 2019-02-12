class Api::V1::UsersController<ApplicationController

  def create
    user = User.create(user_params) if matching_passwords?
    if user.save
      # session[:user_id] = user.id
    else
      render json: UserSerializer.new({message: successfully_created_message(user), user_id: user.id})
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def matching_passwords?
    params[:password] == params[:password_confirmation]
  end

  def successfully_created_message(user)
    "Account successfully created for #{user.first_name} #{user.last_name}."
  end

end
