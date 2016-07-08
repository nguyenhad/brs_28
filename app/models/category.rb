class Category < ActiveRecord::Base

  include Kaminari::ActiveRecordModelExtension
  has_many :books

  validates :name, presence: true, length: {maximum: 50},
    uniqueness: {case_sensitive: false}
end
