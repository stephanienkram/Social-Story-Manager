class Character < ActiveRecord::Base
  attr_accessible :elevator, :name, :project_id
  belongs_to :projects
  has_and_belongs_to_many :chapters, :locations, :pictures
  
  validates :name, presence: true
  validates :project_id, presence: true
end
