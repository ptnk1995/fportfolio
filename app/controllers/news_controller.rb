class NewsController < ApplicationController
  before_action :load_categories
  before_action :authenticate_user!, only: [:new, :create]

  def index
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
    if @new
      @posts_relate = @new.category.posts.news.except_id(@new.id).order_by_newest
    else
      flash[:warning] = t "record_isnt_exist"
      redirect_to root_url
    end
  end

  def new
    @new = current_user.posts.new
  end

  def create
    @new = current_user.posts.new new_params
    if @new.save
      flash[:success] = t "flash.news_created"
      redirect_to news_index_path
    else
      flash[:danger] = t "flash.news_create_failed"
      render :new
    end
  end

  private
  def new_params
    params.require(:post).permit(:title, :content, :image,
      :user_id, :category_id).merge(target_type: Post.target_types[:news])
  end

  def load_categories
    @categories = Category.news
  end
end
