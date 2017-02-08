class NewsController < ApplicationController
  def index
    @categories = Category.news
    if params[:category].blank?
      @news = Post.news.order_by_newest.page(params[:page]).per Settings.per_page.blog
    else
      @category = Category.news.find_by id: params[:category]
      if @category
        @news = @category.posts.post_by_category_and_type(params[:category], Post.target_types[:news])
          .order_by_newest.page(params[:page]).per Settings.per_page.blog
      else
        flash[:danger] = t "record_isnt_exist"
        redirect_to blogs_path
      end
    end
  end

  def show
    @new = Post.find_by id: params[:id]
    unless @new
      flash[:warning] = t "record_isnt_exist"
      redirect_to root_url
    end
  end
end
