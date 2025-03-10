class Player < ApplicationRecord
    has_many :games, foreign_key: :player_1_id
    has_many :games, foreign_key: :player_2_id
    has_many :games, foreign_key: :player_3_id
    has_many :games, foreign_key: :player_4_id
  
    validates :name, presence: true
    validates :skill_level, presence: true, numericality: { only_integer: true, greater_than: 0 }
  end
  