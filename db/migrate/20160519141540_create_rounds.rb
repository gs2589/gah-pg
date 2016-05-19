class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :game_id
      t.integer :judge_id
      t.integer :prompt_id
      t.integer :winner_id
    end
  end
end
