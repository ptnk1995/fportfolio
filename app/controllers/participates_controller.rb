class ParticipatesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_project, only: :create

  def create
    @participate = @project.participates.find_by user_id: participate_params[:user_id]
    if @participate
      flash[:danger] = t "available"
    else
      @participate = @project.participates.build participate_params
      if @participate.save
        flash[:success] = t "participates.created"
      else
        flash[:danger] = t "participates.create_failed"
      end
    end
    redirect_to users_path
  end

  private
  def participate_params
    params.require(:participate).permit(:description, :user_id, :project_id)
      .merge is_accept: true
  end

  def load_project
    @project = Project.find_by id: participate_params[:project_id]
    unless @project
      flash[:danger] = t "project_not_found"
      redirect_to root_url
    end
  end
end
