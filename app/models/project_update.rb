class ProjectUpdate < ActiveRecord::Base
  attr_accessible :project_id, :update
  belongs_to :project
end
