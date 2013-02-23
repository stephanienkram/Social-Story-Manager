class Author < ActiveRecord::Base
  attr_accessible :email, :location, :summary, :username, :password, :password_confirmation
  has_many :author_statuses, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :author_authors, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_authors, through: :author_authors, source: :followed
  
  has_many :reverse_relationships, foreign_key: "followed_id",
  									class_name: "AuthorAuthor",
  									dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  
  has_secure_password
  
  before_create :default_values
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  before_save :default_values
  
  validates :username, presence: true, length: { maximum:50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6}
  validates :password_confirmation, presence: true
  
  def feed
	AuthorStatus.from_users_followed_by(self)
  end
  
  def following?(other_author)
  	author_authors.find_by_followed_id(other_author.id)
  end
  
  def follow!(other_author)
  	author_authors.create!(followed_id: other_author.id)
  end
  
  def unfollow!(other_author)
  	author_authors.find_by_followed_id(other_author.id).destroy
  end
  
  private
    def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
    end
  
  	def default_values
  		self.location ||= ''
  		self.summary ||= ''
  	end
  
end
