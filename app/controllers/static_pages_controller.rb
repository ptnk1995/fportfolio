class StaticPagesController < ApplicationController
  def home
    @key = Settings.link_map + ENV["GOOGLE_API_KEY"]
    @projects = Project.order_by_newest.limit Settings.limit_project
  end
end
