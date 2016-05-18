class AddPickToPrompts < ActiveRecord::Migration
  def change
    add_column :prompts, :pick, :integer
  end
end
