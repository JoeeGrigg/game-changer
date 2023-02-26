class Session < ApplicationRecord  
  has_many :players, class_name: "SessionPlayer"
  has_many :session_game_challenges
  has_many :games, through: :session_game_challenges
  has_many :challenges, through: :session_game_challenges

  enum :status, configuring: 0, configuring_add_players: 1, started: 2, complete: 3
  
  before_validation :init, on: :create
  before_validation :generate_code, on: :create
  
  validates :code, :status, presence: true
  validates :number_of_games, :rounds, numericality: { greater_than: 0 }
  validate :validate_before_start

  def init
    self.status = :configuring
    self.number_of_games = 1 unless number_of_games.present?
    self.rounds = 1 unless rounds.present?
  end

  def generate_code
    self.code = SecureRandom.uuid
  end

  def start!
    generate_session_game_challenges
    self.update!(status: :started)
  end

  def generate_session_game_challenges
    games = Game.order("RANDOM()").limit(number_of_games)
    session_games = games.size == number_of_games ? games : (
      games.to_a * (
        number_of_games.to_f / games.size
      ).ceil
    ).take(number_of_games)
    (1..rounds).inject([]){|x, _| x.push(session_games) }.flatten.each_with_index do |game, round|
      challenges = game.challenges.order("RANDOM()").limit(players.size)
      challenges.each_with_index do |challenge, i|
        session_game_challenges.create!(game: game, challenge: challenge, round: round + 1, judge: players[i])
      end
    end
  end

  def next_challenge
    session_game_challenges.where(done: false).order(:round).first
  end

  private

  def validate_before_start
    if !status.start_with?("configuring") && players.count < 3
      errors.add(:base, "Cannot start game until at least 3 players")
    end
  end
end
