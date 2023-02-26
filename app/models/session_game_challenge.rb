class SessionGameChallenge < ApplicationRecord
  belongs_to :session
  belongs_to :game
  belongs_to :challenge
  belongs_to :player, class_name: "SessionPlayer"
  belongs_to :judge, class_name: "SessionPlayer"
  
  before_validation :init, on: :create

  validates :session, :game, :challenge, :player, :judge, presence: true
  validates :done, inclusion: { in: [ true, false ] }
  validates :round, numericality: { greater_than: 0 }

  def init
    self.done = false
  end

  def session_game_challenge_id
    id
  end
end
