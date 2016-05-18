class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.string :phrase
    end
  end
end
