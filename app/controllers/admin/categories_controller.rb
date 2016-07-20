class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  before_action :check_exist_books, only: :destroy

  def index
    @search = Category.search params[:q]
    @categories = @search.result.page(params[:page]).per Settings.per_page
    if @categories.blank?
      flash[:alert] =
        t "controllers.admin.categories.flash.alert.search_category"
      redirect_to admin_categories_path
    end
  end

  def show
    if @category.present?
      @books = Book.in_category(params[:category_id])
    else
      flash[:alert] =
        "controllers.admin.categories.flash.alert.show_book"
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] =
        t "controllers.admin.categories.flash.success.create_category"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] =
        t "controllers.admin.categories.flash.success.edit_category"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] =
      t "controllers.admin.categories.flash.success.delete_category"
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name
  end

  def check_exist_books
    if @category.books.any?
      flash[:danger] =
        t "controllers.admin.categories.flash.danger.delete_category"
      redirect_to admin_categories_path
    end
  end
end
