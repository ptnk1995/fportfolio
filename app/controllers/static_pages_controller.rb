class StaticPagesController < ApplicationController
  def home
  end

  def blog
    render layout: "application_blog"
  end
end
