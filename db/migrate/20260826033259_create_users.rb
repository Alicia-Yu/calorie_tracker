class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.integer :daily_calorie_goal
      t.integer :daily_protein_goal

      t.timestamps
    end
  end
end
