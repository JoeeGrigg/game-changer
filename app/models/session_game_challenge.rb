class SessionGameChallenge < ApplicationRecord
  belongs_to :session
  belongs_to :game
  belongs_to :challenge
  belongs_to :player, class_name: "SessionPlayer"
  belongs_to :judge, class_name: "SessionPlayer"
  belongs_to :winner, class_name: "SessionPlayer", required: false, validate: false
  
  before_validation :init, on: :create

  validates :session, :game, :challenge, :player, :judge, presence: true
  validates :done, inclusion: { in: [ true, false ] }
  validates :round, numericality: { greater_than: 0 }
  validate :validate_winner, on: :update

  def init
    self.done = false
  end

  def session_game_challenge_id
    id
  end

  private

  def validate_winner
    case winner_id
    when nil
      errors.add(:base, "Must specify a scorer")
    when 0
      self.winner_id = nil
    else
      if session.players.find_by(id: winner_id).nil?
        errors.add(:base, "Player must belong to game")
      end
    end
  end
end
