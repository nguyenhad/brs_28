class Admin::BookRequestsController < ApplicationController
  load_and_authorize_resource

  def index
    @book_requests = BookRequest.order(created_at: :desc)
      .page(params[:page]).per Settings.per_page
  end

  def update
    if @book_request.update_attributes status: Settings.status
      flash[:info] = t "views.admin.requests.success"
      Admin::RequestMailer.accept_request(@book_request).deliver_now
    else
      flash[:danger] = t "views.admin.requests.failed"
    end
    redirect_to admin_book_requests_path
  end
end
