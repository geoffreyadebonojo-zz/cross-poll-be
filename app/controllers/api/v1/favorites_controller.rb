class Api::V1::FavoritesController < ApplicationController

  def create
    user = User.find_by(api_token: params[:api_token])
    if user != nil
      user.favorites.create(favorite_id: params[:favorite_id])
      render :json => {:message => "Successfully added favorite with id #{params[:favorite_id]}"}.to_json, :status => 200
    else
      render :json =>{:error => "Cannot find user with this api token"}.to_json, :status => 404
    end
  end

  def index
    user = User.find_by(api_token: params[:api_token])
    if user!=nil
      render json: FavoriteSerializer.new(user.favorites)
    else
      render :json => {:error => "Cannot find user with this api token"}.to_json, :status =>404
    end
  end

end
