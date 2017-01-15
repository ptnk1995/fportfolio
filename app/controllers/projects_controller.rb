class ProjectsController < ApplicationController
  before_action :check_max_files, only: :create
  before_action :authenticate_user!, only: :create

  def new
    @categories = Category.all
  end

  def index
    @projects = Project.order_by_newest.page(params[:page])
      .per Settings.per_page.projects
  end

  def create
    @project = current_user.projects.new project_params
    if current_user.save
      images_params[:images].each {|image| @project.images.build(image: image).save}
      flash[:success] = t "project.created"
      redirect_to root_url
    else
      flash[:danger] = t "project.create_failed"
      render :new
    end
  end

  def show
  end

  def update
  end

  private
  def check_max_files
    if images_params[:images].size > Settings.project.max_image_files
      flash[:danger] = t "project.check_max_files"
      render :new
    end
  end

  def project_params
    params.require(:project).permit :name, :url, :description, :core_features,
      :realease_note, :git_repository, :server_information, :platform, :category_id
  end

  def images_params
    params.require(:project).permit images: []
  end
end
