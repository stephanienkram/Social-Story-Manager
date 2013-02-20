class Location < ActiveRecord::Base
  attr_accessible :elevator, :name, :project_id
  belongs_to :project
  has_many :location_summaries, dependent: :destroy
  
  validates :project_id, presence: true
  validates :name, presence: true
end
