class Chapter < ActiveRecord::Base
  attr_accessible :body, :notes, :project_id, :title
  belongs_to :project

  
  validates :project_id, presence: true
end
