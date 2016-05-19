class DropPlayerGames < ActiveRecord::Migration
  def change
    drop_table :player_games
  end
end
