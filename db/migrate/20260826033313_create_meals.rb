class CreateMeals < ActiveRecord::Migration[8.1]
  def change
    create_table :meals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :meal_type
      t.integer :calories
      t.integer :protein
      t.date :date
      t.string :description

      t.timestamps
    end
  end
end
