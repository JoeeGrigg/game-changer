class CreateSessionGameChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :session_game_challenges do |t|
      t.belongs_to :session, null: false
      t.belongs_to :game, null: false
      t.belongs_to :challenge, null: false
      t.boolean :done, null: false, default: false
      t.integer :round, null: false
      t.integer :player_id, null: false
      t.integer :judge_id, null: false
      t.integer :winner_id
      t.timestamps
    end
  end
end
