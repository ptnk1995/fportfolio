class UsersController < ApplicationController

  def index
    @users = User.order_by_newest.page(params[:page]).per Settings.per_page.user
    @projects = current_user.projects
  end
end
