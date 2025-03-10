class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :match_schedule, null: false, foreign_key: true
      t.references :player_1, null: false, foreign_key: { to_table: :players }
      t.references :player_2, null: false, foreign_key: { to_table: :players }
      t.references :player_3, null: false, foreign_key: { to_table: :players }
      t.references :player_4, null: false, foreign_key: { to_table: :players }
      t.integer :game_number

      t.timestamps
    end
  end
end
