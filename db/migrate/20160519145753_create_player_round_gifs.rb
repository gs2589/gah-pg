class CreatePlayerRoundGifs < ActiveRecord::Migration
  def change
    create_table :player_round_gifs do |t|
      t.integer :player_id
      t.integer :round_id
      t.integer :gif_id
    end
  end
end





