class AddWinningGifIdToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :winning_gif_id, :integer
  end
end
