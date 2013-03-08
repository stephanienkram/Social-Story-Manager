class Project < ActiveRecord::Base
  attr_accessible :elevator, :name, :notes, :skeleton
  belongs_to :author
  has_many :outlines, dependent: :destroy
  has_many :chapters, dependent: :destroy
  has_many :characters, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :pictures, dependent: :destroy
  
  before_create :create_notice
	before_save :add_update
  
    default_scope order: 'projects.updated_at DESC'
  
  validates :name, presence: true
  validates :author_id, presence: true
  
  private
  	def add_update
  		author = Author.find(author_id)
  		string = '<%= link_to @self.name, @self %>'
  		author.author_statuses.create!(status: "%s updated %{title}" %{name: author.username, title: string}) 
  	end
  	
  	def create_notice
  		author = Author.find(author_id)
  		string = '<%= link_to @self.name, @self %>'
  		author.author_statuses.create!(status: "%{name} has created a new project! %{title}" %{name: author.username, title: string})
  	end
  
end
