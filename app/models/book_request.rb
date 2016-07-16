class BookRequest < ActiveRecord::Base
  enum status: [:not_accept, :pending, :accepted]

  belongs_to :user
end
