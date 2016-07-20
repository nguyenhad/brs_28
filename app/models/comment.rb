class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, model){controller && controller.current_user}

  belongs_to :review
  belongs_to :user

  scope :load_all_comments, -> id_review{
    joins(:comment).where comment:{review_id: id_review}
  }
end
