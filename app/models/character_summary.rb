class CharacterSummary < ActiveRecord::Base
  attr_accessible :body, :character_id, :heading
  belongs_to :character
  
  validates :character_id, presence: true
end
