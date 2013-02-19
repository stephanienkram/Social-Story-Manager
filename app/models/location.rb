class Location < ActiveRecord::Base
  attr_accessible :elevator, :name, :project_id
  belongs_to :projects
  has_and_belongs_to_many :chapters, :characters, :pictures
  has_many :location_summaries
  
  validates :project_id, presence: true
  validates :name, presence: true
end
