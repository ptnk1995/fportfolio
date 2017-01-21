class ChatsController < ApplicationController
  before_action :load_project, only: :index

  layout false
  layout "application_none"
  def index
    message = Message.new
  end

  def show
  end

  private
  def load_project
    @project = Project.find_by id: params[:project_id]
  end
end
