class Game < ApplicationRecord
  has_many :challenges

  enum :scoring, boolean: 0, player_selection: 1
  
  validates :name, presence: true, uniqueness: true
  validates :scoring, presence: true
end
