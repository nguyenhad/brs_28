class Comment < ActiveRecord::Base
  belongs_to :review
  belong_to :user
end
