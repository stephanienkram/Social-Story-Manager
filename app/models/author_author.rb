class AuthorAuthor < ActiveRecord::Base
  attr_accessible :followed_id, :follower_id
  
  belongs_to :follower, class_name: "Author"
  belongs_to :followed, class_name: "Author"
  
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
