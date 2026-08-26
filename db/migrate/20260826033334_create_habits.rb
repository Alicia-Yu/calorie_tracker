class CreateHabits < ActiveRecord::Migration[8.1]
  def change
    create_table :habits do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :water_completed
      t.boolean :steps_completed
      t.date :date

      t.timestamps
    end
  end
end
