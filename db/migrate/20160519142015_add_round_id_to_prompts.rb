class AddRoundIdToPrompts < ActiveRecord::Migration
  def change
    add_column :prompts, :round_id, :integer
  end
end
