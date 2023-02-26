class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.integer :scoring, null: false
      t.boolean :pick_a_partner, null: false
      t.timestamps
    end
  end
end
