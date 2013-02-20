class LocationSummary < ActiveRecord::Base
  attr_accessible :body, :heading, :location_id
  belongs_to :location
  
  validates :location_id, presence: true
end
