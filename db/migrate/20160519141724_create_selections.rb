class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.integer :player_id
      t.integer :round_id
      t.integer :gif_id
    end
  end
end
