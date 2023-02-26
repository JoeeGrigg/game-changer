class Game < ApplicationRecord
  has_many :challenges
  
  validates :name, presence: true, uniqueness: true
end
