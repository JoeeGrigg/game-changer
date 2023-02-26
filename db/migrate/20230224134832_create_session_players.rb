class CreateSessionPlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :session_players do |t|
      t.belongs_to :session, null: false
      t.string :name, null: false
      t.integer :score, null: false, default: 0
      t.timestamps
    end
  end
end
