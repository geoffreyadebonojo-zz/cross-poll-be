class Api::V1::UsersController<ApplicationController

  def create
    if current_user
      render :json => {:error => "There is already an account created with this email address. Check your password, or register with a different email address to log in."}.to_json, :status => 401
    else
      user = User.create(user_params) if matching_passwords?
      if user!= nil && user.save
        render json: UserSerializer.new(user)
      else
        render :json => {:error => "Make sure passwords match, and a proper email address was provided"}.to_json, :status => 400
      end
    end
  end

  private

  def current_user
    User.where(email: user_params[:email]) != []
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :api_token)
  end

  def matching_passwords?
    params[:password] == params[:password_confirmation]
  end

end
