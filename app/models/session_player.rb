class SessionPlayer < ApplicationRecord
  belongs_to :session

  validates :session, :name, presence: true
end
