class HomesController < ApplicationController
  before_action :authenticate_user!

  def new
    @home = Home.new
    @home.images.build
  end

  def create
    @home = Home.find_by language: params[:home][:language]
    if @home
      @home.images.destroy_all
      @home.update_attributes home_params
      redirect_to root_path
    else
      @home = Home.new home_params
      if @home.save
        flash[:success] = t "home_pages.created"
        redirect_to users_path
      else
        flash[:danger] = t "images.create_failed"
        render :new
      end
    end
  end

  private

  def home_params
    params.require(:home).permit :title, :sologan, :description, 
      :language, images_attributes: [:id, :image, :image_cache, :_destroy]
  end
end
