class UsersController < ApplicationController

  def index
    @users = User.order_by_newest.page(params[:page]).per Settings.per_page.user
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "profile.created"
      redirect_to root_url
    else
      flash[:error] = t "profile.create_fail"
      render new_user_path
    end
  end

  def show
    @user = User.find_by id: params[:id]
    if @user
      @certificate_users = @user.certificate_users
      @techniques = @user.techniques
    else
      flash[:warning] = t "record_isnt_exist"
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :user_name, :email, :password,
      :password_confirmation
  end
end
