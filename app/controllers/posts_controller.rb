class PostsController < ApplicationController
  before_action :load_new_categories

  def new
    @post = Post.new
  end

  def create
  end

  private
  def new_params
    params.require(:post).permit(:title, :content, :image,
      :user_id, :category_id).merge(target_type: Post.target_types[:news])
  end

  def load_new_categories
    @categories = Category.news
  end
end
