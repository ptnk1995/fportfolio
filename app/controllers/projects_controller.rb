class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def new
    @categories = Category.all
    @project = Project.new
    @project.images.build
  end

  def index
    @projects = Project.order_by_newest.page(params[:page])
      .per Settings.per_page.projects
  end

  def create
    @project = current_user.projects.new project_params
    if current_user.save
      flash[:success] = t "projects.created"
      redirect_to users_path
    else
      @categories = Category.all
      flash[:danger] = t "images.create_failed"
      render :new
    end
  end

  def show
    @project = Project.find_by id: params[:id]
    @message = Message.new
    if @project
      @images = @project.images
      @members = @project.users.merge(Participate.accepted)
      @comments = @project.comments
      @like = @project.likes.find_by(user_id: current_user.id)
      @user_likes = Hash.new
      @project.likes.each do |like|
      @user = User.find_by(id: like.user_id)
      @user_likes[like.user_id] = @user
    end
    else
      flash[:warning] = t "record_isnt_exist"
      redirect_to root_url
    end
  end

  def update
  end

  private
  def project_params
    params.require(:project).permit :name, :url, :description, :core_features,
      :realease_note, :git_repository, :server_information, :platform, :category_id,
      images_attributes: [:image]
  end
end
