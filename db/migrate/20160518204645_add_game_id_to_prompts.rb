class AddGameIdToPrompts < ActiveRecord::Migration
  def change
    add_column :prompts, :game_id, :integer
  end
end
