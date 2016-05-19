class AddChampionIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :champion_id, :integer
  end
end
