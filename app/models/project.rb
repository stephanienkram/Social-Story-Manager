class Project < ActiveRecord::Base
  attr_accessible :elevator, :name, :notes, :skeleton
  belongs_to :author
  has_many :outlines, dependent: :destroy
  has_many :chapters, dependent: :destroy
  has_many :characters, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :pictures, dependent: :destroy
  
  validates :name, presence: true
  validates :author_id, presence: true
end
