class Picture < ActiveRecord::Base
  attr_accessible :location, :name, :project_id
  belongs_to :projects
  has_and_belongs_to_many :chapters, :characters, :locations
  
  validates :project_id, presence: true
  validates :location, presence: true
end
