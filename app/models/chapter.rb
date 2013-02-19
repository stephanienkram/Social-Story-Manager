class Chapter < ActiveRecord::Base
  attr_accessible :body, :notes, :project_id, :title
  belongs_to :projects
  has_and_belongs_to_many :characters, :locations, :pictures
  
  validates :project_id, presence: true
end
