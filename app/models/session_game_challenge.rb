class SessionGameChallenge < ApplicationRecord
  belongs_to :session
  belongs_to :game
  belongs_to :challenge
  belongs_to :judge, class_name: "SessionPlayer"
  
  before_validation :init, on: :create

  validates :session, :game, :challenge, :judge, presence: true
  validates :done, inclusion: { in: [ true, false ] }
  validates :round, numericality: { greater_than: 0 }

  def init
    self.done = false
  end
end
