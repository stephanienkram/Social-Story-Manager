class Outline < ActiveRecord::Base
  attr_accessible :description, :notes, :order, :project_id, :title
  belongs_to :projects
  
  validates :project_id, presence: true
  validates :order, presence: true
  validates :title, presence: true
end
