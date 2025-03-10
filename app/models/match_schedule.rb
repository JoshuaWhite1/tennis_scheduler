class MatchSchedule < ApplicationRecord
    has_many :games, dependent: :destroy
    validates :date, presence: true
  end
  