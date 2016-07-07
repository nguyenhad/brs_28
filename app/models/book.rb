class Book < ActiveRecord::Base
  has_many :reviews
  has_many :user_books
  belongs_to :category
end
