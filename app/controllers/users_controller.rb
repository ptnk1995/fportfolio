class UsersController < ApplicationController

  layout false
  layout "application_none", only: :show
  def index
    @users = User.order_by_newest.page(params[:page]).per Settings.per_page.user
  end

  def show
    @user = User.find_by id: params[:id]
    @certificate_users = @user.certificate_users
    @techniques = @user.techniques
  end
end
