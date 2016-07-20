class Book < ActiveRecord::Base

  mount_uploader :picture, PictureUploader
  validates :title, presence: true, length: {maximum: 50}
  validates :author, presence: true, length: {maximum: 50}
  validates :isbn, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}
  validate :greater_than_or_equal_to

  has_many :reviews
  has_many :user_books
  belongs_to :category

  scope :in_category, -> category_id do
    where category_id: category_id if category_id.present?
  end

  scope :favorite_list, -> user{
    joins(:user_books).where user_books: {user_id: user.id, is_favorite: true}
  }

  scope :read_list, -> user{
    joins(:user_books).where user_books: {user_id: user.id, status: 2}
  }

  private
  def greater_than_or_equal_to
    unless self.pages >= 20
      errors.add(:pages, I18n.t("model.book_page"))
    end
  end
end
