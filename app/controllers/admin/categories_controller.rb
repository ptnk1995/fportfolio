class Admin::CategoriesController < ApplicationController
  before_action :load_category, only: [:destroy, :update, :edit]
  layout "admin"

  def new

  end
end
