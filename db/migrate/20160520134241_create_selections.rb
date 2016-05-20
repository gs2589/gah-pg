class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.integer :player_id
      t.integer :round_id
      t.integer :selected_gif_id

    end
  end
end
