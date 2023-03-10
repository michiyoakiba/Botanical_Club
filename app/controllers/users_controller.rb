class UsersController < ApplicationController
 before_action :is_matching_login_user, only: [:edit, :update] 
  
  def index
  end
  
  def show
    @user = User.find(params[:id])
    @plants = @user.plants.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
      redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to plants_path
    end
  end
end
