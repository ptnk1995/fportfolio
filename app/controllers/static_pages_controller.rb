class StaticPagesController < ApplicationController
  def home
    @contact = Contact.new
    @key = Settings.link_map + ENV["GOOGLE_API_KEY"]
    @projects = Project.show_for_rating.take Settings.limit_project
  end
end
