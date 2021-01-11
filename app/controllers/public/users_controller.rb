class Public::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "更新しました"
    else
      render :edit
    end
  end

  def unsubscribe
    @user = User.find(params[:id])
  end

  def withdraw
    @user = User.find(params[:id])
    # is_deletedカラムにフラグを立てる(defaultはfalse)
    if @user.update(user_params)
      # ログアウトさせる
      reset_session
      redirect_to root_path, notice: "ありがとうございました。またのご利用をお待ちしております。"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

end
