class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    reset_session
    flash[:notice] = "ご利用ありがとうございました。退会しました。"
    redirect_to root_path
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  def reviews
    @users = current_user.following
    @reviews = @users.review.all
  end

  def quit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :gender, :birthday, :address, :profile_image)
  end
end
