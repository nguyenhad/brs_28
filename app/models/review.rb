class Review < ActiveRecord::Base
  belongs_to :book
  belongs_to :user
  has_many :comments

  scope :average_rate, -> id_book{where book_id: id_book}
end
