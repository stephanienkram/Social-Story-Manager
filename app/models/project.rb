class Project < ActiveRecord::Base
  attr_accessible :elevator, :name, :notes, :skeleton
  has_and_belongs_to_many :authors
  has_many :outlines, :chapters, :characters, :locations, :pictures
  
  validates :name, presence: true
end
