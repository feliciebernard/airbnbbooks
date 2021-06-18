class AvatarsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = User.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
    redirect_to(user_path(@user))
  end
end