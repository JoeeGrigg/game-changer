class Game < ApplicationRecord
  has_many :challenges

  enum :scoring, boolean: 0, player_selection: 1
  
  before_validation :init, on: :create
  
  validates :name, presence: true, uniqueness: true
  validates :scoring, presence: true
  validates :pick_a_partner, inclusion: { in: [ true, false ] }

  def init
    self.pick_a_partner = false unless pick_a_partner.present?
  end
end
