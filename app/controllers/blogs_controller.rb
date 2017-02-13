class BlogsController < ApplicationController
  def index
    @categories = Category.blog
    if params[:category].blank?
      @blogs = Post.blog.order_by_newest.page(params[:page]).per Settings.per_page.blog
    else
      @category = Category.find_by id: params[:category]
      if @category
        @blogs = @category.posts.post_by_category_and_type(params[:category], Post.target_types[:blog])
          .order_by_newest.page(params[:page]).per Settings.per_page.blog
      else
        flash[:danger] = t "record_isnt_exist"
        redirect_to blogs_path
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

  def new
    @categories = Category.blog
    target_type = 0
  end

  def create
    @blog = current_user.posts.new post_params
    @categories = Category.blog
    if current_user.save
      flash[:success] = t "project.created"
      redirect_to blogs_path
    else
      flash[:danger] = t "project.create_failed"
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :image,
      :user_id, :category_id).merge(target_type: 0)
  end
end
