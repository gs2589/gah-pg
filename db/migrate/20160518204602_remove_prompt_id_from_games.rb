class RemovePromptIdFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :prompt_id, :integer
    remove_column :games, :player_id, :integer
  end
end
