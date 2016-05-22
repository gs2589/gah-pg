class FixNameOfSelectedGifId < ActiveRecord::Migration
  def change
    rename_column :selections, :selected_gif_id, :gif_id
  end
end
