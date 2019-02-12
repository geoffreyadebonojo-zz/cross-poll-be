class Api::V1::SessionsController < ApplicationController

  def create
    if valid_user?
      session[:user_id] = current_user.id
      render :json => {:success => "#{current_user.first_name} is logged in."}.to_json, :status => 201
    else
      render :json => {:error => "Check email and password, we can't seem to find this account"}.to_json, :status => 404
    end
  end

  private

  def current_user
    @user ||= User.find_by(email: params[:email])
  end

  def valid_user?
    current_user.authenticate(params[:password]) if current_user
  end

end
