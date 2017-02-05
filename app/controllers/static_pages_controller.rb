class StaticPagesController < ApplicationController
  def home
    @projects = Project.order_by_newest.limit Settings.limit_project
  end
end
