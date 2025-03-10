class CreateMatchSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :match_schedules do |t|
      t.date :date

      t.timestamps
    end
  end
end
