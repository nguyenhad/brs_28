class Review < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  scope :average_rate, ->(id_book){
    where book_id: id_book
  }
end
