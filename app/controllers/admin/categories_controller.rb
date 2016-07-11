class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Kaminari.paginate_array(Category.all.order(created_at: :desc))
      .page(params[:page]).per Settings.per_page
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "controllers.admin.categories.flash.success.edit_category"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "controllers.admin.categories.flash.success.create_category"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
