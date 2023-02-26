class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.belongs_to :game, null: false
      t.string :value, null: false
      t.integer :difficulty, null: false
      t.timestamps
    end
  end
end
