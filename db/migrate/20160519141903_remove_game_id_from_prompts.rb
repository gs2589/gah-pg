class RemoveGameIdFromPrompts < ActiveRecord::Migration
  def change
    remove_column :prompts, :game_id, :integer
  end
end
