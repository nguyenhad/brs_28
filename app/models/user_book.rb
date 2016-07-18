class UserBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  enum status: [:unread, :reading, :read]
end
