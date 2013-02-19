class ProjectStatus < ActiveRecord::Base
  attr_accessible :project_id, :status
  belongs_to :projects
end
