class ProfilesController < ApplicationController
  expose(:user)
  expose(:reviews) { user.reviews.order(created_at: :desc).limit(5) }

  def show
    user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url, flash: {error: 'User not found.'}
  end
end