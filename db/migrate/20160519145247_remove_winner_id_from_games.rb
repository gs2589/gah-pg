class RemoveWinnerIdFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :winner_id, :integer
  end
end
