class Admin::CategoriesController < ApplicationController
  def index
    categories = Category.all.order(created_at: :desc)
    @categories = Kaminari.paginate_array(categories).page(params[:page]).
      per Settings.per_page
  end
end
