class CreateLanes < ActiveRecord::Migration[8.0]
  def change
    create_table :lanes do |t|
      t.references :race, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
