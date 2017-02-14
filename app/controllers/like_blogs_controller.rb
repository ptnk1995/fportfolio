class LikeBlogsController < ApplicationController
  before_action :load_blog, only: [:create, :destroy]

  def create
    @like = @blog.likes.build user_id: current_user.id
    if @like.save
      respond_to do |format|
        format.js
      end
    end 
  end

  def destroy
    @like = @blog.likes.find_by user_id: current_user.id
    if @like.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def load_blog
    @blog = Post.find_by id: params[:id]
    render file: Settings.page_404_url unless @blog
  end
end
