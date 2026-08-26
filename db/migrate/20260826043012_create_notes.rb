class CreateNotes < ActiveRecord::Migration[8.1]
  def change
    create_table :notes do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.string :energy_level
      t.string :mood
      t.date :date

      t.timestamps
    end
  end
end
