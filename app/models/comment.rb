class Comment < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  scope :load_all_comments, -> id_review{
    joins(:comment).where comment:{review_id: id_review}
  }
end
