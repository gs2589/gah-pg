class Game < ActiveRecord::Base

  has_many :players, through: :player_games
  has_one :prompt
  belongs_to :winner, class_name: "Player" # as a winner, how do we record this?

end
