class Admin::CategoriesController < Admin::BaseController
  before_action :find_category, only: [:edit, :update, :destroy, :sort]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: 'Category created successfully'
    else
      render :new, notice: 'Category created failed'
    end
  end

  def edit

  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: 'Category updated successfully'
    else
      render :new, notice: 'Category updated failed'
    end
  end

  def destroy
    if @category.destroy
      redirect_to admin_categories_path, notice: 'Category deleted successfully'
    else
      render :new, notice: 'Category deleted failed'
    end
  end

  def sort
    if @category.insert_at(params[:to].to_i + 1)
      render json: { status: 'success' }
    else
      render json: { status: 'fail' }
    end
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
