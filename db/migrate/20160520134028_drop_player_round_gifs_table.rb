class DropPlayerRoundGifsTable < ActiveRecord::Migration
  def change
    drop_table :player_round_gifs
  end
end
