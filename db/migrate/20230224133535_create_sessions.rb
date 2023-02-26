class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.string :code, null: false
      t.integer :status
      t.string :name
      t.integer :number_of_games, null: false, default: 1
      t.integer :rounds, null: false, default: 1
      t.timestamps
    end
  end
end

