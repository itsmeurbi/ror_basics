class LikesController < ApplicationController
  def create
    likeable = params[:likeable_type].constantize.find(params[:likeable_id])
    Like.create(likeable: likeable, user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Like.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end
end
