class Api::V1::RatingsController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      create_rating
      create_store

      return json: @rating
    end
  end

  def create_rating
    @rating = Rating.new(rating_params)
    @rating.stroe_id = params[:id]
    @rating.save
  end

  def create_store
    @store = Store.find_or_create_by(
      lonlat: "POINT(#{params[:store][:longitude].to_f} #{params[:store][:latitude].to_f})"
      name: params[:store][:name],
      address: params[:store][:address],
      google_place_id: params[:store][:google_place_id]
    )
  end

  def rating_params
    params.require(:rating).permit(:value, :opinion, :user_name)
  end
end
