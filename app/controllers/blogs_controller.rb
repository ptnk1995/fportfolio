class BlogsController < ApplicationController
  def index
    @categories = Category.all
    if params[:category].blank?
      @blogs = Post.post_by_type(Post.target_types[:blog]).order_by_newest.page(params[:page])
      .per Settings.per_page.blog
    else
      @category = Category.find_by id: params[:category]
      unless @category
        flash[:danger] = t "record_isnt_exist"
        redirect_to blogs_path
      else
        @blogs = @category.posts.post_by_category_and_type(params[:category], Post.target_types[:blog])
        .order_by_newest.page(params[:page])
        .per Settings.per_page.blog
      end
    end
  end

  def show
    @blog = Post.find_by id: params[:id]
    unless @blog
      flash[:warning] = t "record_isnt_exist"
      redirect_to root_url
    end
  end
end
