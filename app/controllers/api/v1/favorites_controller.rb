class Api::V1::FavoritesController < ApplicationController

  def create
    user = User.find_by(api_token: params[:api_token])
    if user != nil
      new_fav = Favorite.find_or_create_by(favorite_id: params[:favorite_id])
      if user.favorites.find_by(favorite_id: params[:favorite_id]) != nil
        render :json => {:error => "You've already saved this pet to your favorites."}
      else
        UserFavorite.create(user_id: user.id, favorite_id: new_fav.id)
        render :json => {:message => "Successfully added favorite with id #{params[:favorite_id]}"}.to_json, :status => 200
      end
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

  def destroy
    user = User.find_by(api_token: params[:api_token])
    if user!=nil
      user.favorites.delete(Favorite.find_by(favorite_id: params[:favorite_id]))
      render json: FavoriteSerializer.new(user.favorites)
    else
      render :json => {:error => "Cannot find user with this api token"}.to_json, :status =>404
    end
  end

end
