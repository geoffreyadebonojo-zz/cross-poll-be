class Api::V1::UsersController<ApplicationController

  def create
    user = User.new(user_params)
    if user.save && matching_passwords?
      render :json => UserSerializer.new(user), :status => 201
    else
      render :json => {:error => "Make sure passwords match, and a proper email address was provided"}.to_json, :status => 401
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :api_token)
  end

  def matching_passwords?
    params[:password] == params[:password_confirmation]
  end

end
