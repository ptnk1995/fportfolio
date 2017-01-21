class BlogsController < ApplicationController
  layout false
  layout "application_none"
  def index
    @blogs = Post.order_by_newest.get_blog(Post.target_types[:blog])
    .page(params[:page]).per Settings.per_page.projects
  end

  def show
    @blog = Post.find_by id: params[:id]
  end
end
