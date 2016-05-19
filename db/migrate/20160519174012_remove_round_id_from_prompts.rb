class RemoveRoundIdFromPrompts < ActiveRecord::Migration
  def change
    remove_column :prompts, :round_id, :integer
  end
end
