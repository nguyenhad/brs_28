class BookRequestsController < ApplicationController
  load_and_authorize_resource
  before_action :check_request, only: [:show, :destroy]

  def index
    @book_requests = (current_user.book_requests.order created_at: :desc)
      .page(params[:page]).per Settings.per_page
  end

  def show
  end

  def new
    @book_request = current_user.book_requests.new
  end

  def edit
  end

  def update
    if @book_request.update_attributes book_request_params
      flash[:success] = t "views.requests.edit_success"
      redirect_to book_requests_path
    else
      render :edit
    end
  end

  def create
    @book_request = current_user.book_requests.new book_request_params
    if @book_request.save
      flash[:success] = t "views.requests.request_created"
      redirect_to book_requests_path
    else
      render :new
    end
  end

  def destroy
    if @book_request.destroy
      flash[:success] = t "views.requests.deleted"
    else
      flash[:error] = t "views.requests.fail"
    end
    redirect_to book_requests_path
  end

  private
  def book_request_params
    params.require(:book_request).permit :user_id, :title, :author
  end

  def check_request
    if @book_request.nil?
      flash[:danger] = t "views.requests.invalid"
      redirect_to book_requests_path
    end
  end
end
