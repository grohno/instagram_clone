class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user, only: %i[ show edit update ]

  def new
    @user = User.new
  end

  def confirm
    @user = current_user.users.build(user_params)
    render :new if @user.invalid?
  end

  def edit
    if params[:back]
      @user = User.new(user_params)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def update
    if @user.update(user_edit_params)
      redirect_to user_path, notice: "ユーザー情報を編集しました"
    else
      render :edit
    end
  end

  def show
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def user_edit_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end
end
