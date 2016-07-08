class Category < ActiveRecord::Base

  include Kaminari::ActiveRecordModelExtension
  has_many :books
end
