class Game < ApplicationRecord
  belongs_to :match_schedule
  belongs_to :player_1, class_name: "Player"
  belongs_to :player_2, class_name: "Player"
  belongs_to :player_3, class_name: "Player"
  belongs_to :player_4, class_name: "Player"

  validates :game_number, inclusion: { in: [1, 2, 3] }
end
