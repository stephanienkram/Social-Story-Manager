class Character < ActiveRecord::Base
  attr_accessible :elevator, :name, :project_id
  belongs_to :project
  has_many :character_summaries, dependent: :destroy
  
  validates :name, presence: true
  validates :project_id, presence: true
end
