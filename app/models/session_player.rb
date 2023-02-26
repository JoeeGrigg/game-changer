class SessionPlayer < ApplicationRecord
  belongs_to :session
  has_many :scored_challenges, class_name: "SessionGameChallenge", foreign_key: :winner_id

  validates :session, :name, presence: true
end
