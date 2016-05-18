class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :prompt_id
      t.integer :player_id
    end
  end
end
