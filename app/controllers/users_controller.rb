class UsersController < ApplicationController
  before_action :baria_user, only: :edit

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
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

  def timeline
    @user = current_user
    @users = @user.following
    @reviews_all = Review.all.reverse_order
    @reviews = []
    # # if singned_in?
    # # end
    @reviews_all.each do |review|
      # 自分の投稿を表示
      if review.user_id == current_user.id
        @reviews.push(review)
      end
      # フォローしている人の投稿を表示
      @users.each do |user|
        if review.user_id == user.id
          @reviews.push(review)
        end
      end
    end
  end

  def favorite
    @user = User.find(params[:id])
    @favorites = @user.favorites
  end

  def quit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :gender, :birthday, :address, :profile_image)
  end

  def baria_user
    @user = User.find(params[:id])
    if current_user != @user
      flash[:alert] = "不正なアクセスです"
      redirect_to root_path
    end
  end
end
