class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @search = Category.search params[:q]
    @categories = @search.result.order(updated_at: :desc).page(params[:page])
      .per Settings.per_page
    if @categories.blank?
      flash[:alert] = t "controllers.categories.flash.alert.search_categories"
      redirect_to categories_path
    end
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
