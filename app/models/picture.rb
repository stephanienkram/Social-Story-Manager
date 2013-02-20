class Picture < ActiveRecord::Base
  attr_accessible :location, :name, :project_id
  belongs_to :project
  
  validates :project_id, presence: true
  validates :location, presence: true
end
