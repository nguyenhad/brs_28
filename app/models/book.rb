class Book < ActiveRecord::Base

  mount_uploader :picture, PictureUploader
  validates :title, presence: true, length: {maximum: 50}
  validates :author, presence: true, length: {maximum: 50}
  validates :isbn, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}

  has_many :reviews
  has_many :user_books
  belongs_to :category

  scope :favorite_list, -> user{
    joins(:user_books).where user_books: {user_id: user.id, is_favorite: true}
  }

  scope :read_list, -> user{
    joins(:user_books).where user_books: {user_id: user.id, status: 2}
  }
end
