class AddTypeAndPasswordDigesttoPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :type, :string
    add_column :players, :password_digest, :string

  end
end
