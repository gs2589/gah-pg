class AddIndexToPlayerGames < ActiveRecord::Migration
  def change
    add_index :player_games, :player_id
    add_index :player_games, :game_id
  end
end
