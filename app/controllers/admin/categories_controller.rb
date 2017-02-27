class Admin::CategoriesController < AdminController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @categories = Category.all
    @category = Category.new category_params
    if @category.save
      flash.now[:success] = t "flash.success.created_subject"
    else
      flash.now[:danger] = t "flash.danger.created_subject"
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "category_admin.update_success"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "category_admin.destroy_success"
      redirect_to admin_categories_path
    else
      flash[:danger] = t "category_admin.destroy_danger"
      redirect_to admin_root_path
    end
  end

  private
    def category_params
      params.require(:category).permit(:name, :target_type)
    end

    def load_category
      @category = Category.find_by id: params[:id]
      if @category.nil?
        flash[:success] = t "category_admin.not_found"
        redirect_to admin_root_path
      end
    end
end
