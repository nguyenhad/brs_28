class Review < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, model){controller && controller.current_user}

  belongs_to :book
  belongs_to :user
  has_many :comments

  scope :average_rate, -> id_book{where book_id: id_book}
end
