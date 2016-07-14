class Book < ActiveRecord::Base

  mount_uploader :picture, PictureUploader
  validates :title, presence: true, length: {maximum: 50}
  validates :author, presence: true, length: {maximum: 50}
  validates :isbn, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}

  has_many :reviews
  has_many :user_books
  belongs_to :category

end
