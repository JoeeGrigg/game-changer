class Challenge < ApplicationRecord
  belongs_to :game

  enum :difficulty, easy: 0, medium: 1, high: 2

  validates :game, :value, :difficulty, presence: true
  validates :value, uniqueness: { scope: :game }
end
