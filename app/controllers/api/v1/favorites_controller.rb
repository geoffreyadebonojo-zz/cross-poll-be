class Api::V1::FavoritesController < ApplicationController

  def create
    user = User.find_by(api_token: params[:api_token])
    user.favorites.create(favorite_id: params[:favorite_id])
    binding.pry
  end

end
