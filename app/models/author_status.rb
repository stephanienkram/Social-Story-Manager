class AuthorStatus < ActiveRecord::Base
  attr_accessible :author_id, :status
  belongs_to :authors
  
  validates :author_id, presence: true
  validates :status, presence: true
end
