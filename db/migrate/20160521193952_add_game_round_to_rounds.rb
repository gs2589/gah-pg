class AddGameRoundToRounds < ActiveRecord::Migration
  def change
     add_column :rounds, :game_round, :integer
  end
end
