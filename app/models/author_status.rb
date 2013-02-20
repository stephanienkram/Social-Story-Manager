class AuthorStatus < ActiveRecord::Base
  attr_accessible :status
  belongs_to :author
  
  validates :author_id, presence: true
  validates :status, presence: true, length: { maximum: 250 }
  
  default_scope order: 'author_statuses.created_at DESC'
  
  def self.from_users_followed_by(author)
  	followed_author_ids = "SELECT followed_id FROM author_authors WHERE follower_id = :author_id"
  	where("author_id IN (#{followed_author_ids}) OR author_id = :author_id", followed_author_ids: followed_author_ids, author_id: author)
  end
end
