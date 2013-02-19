class CharacterSummary < ActiveRecord::Base
  attr_accessible :body, :character_id, :heading
  belongs_to :characters
  
  validates :character_id, presence: true
end
