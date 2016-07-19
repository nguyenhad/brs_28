class ActivitiesController < ApplicationController
  load_and_authorize_resource
  def index
    @activities = PublicActivity::Activity.order(created_at: :desc)
      .page(params[:page]).per Settings.per_page
  end
end
