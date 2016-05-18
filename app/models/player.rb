class Player < ActiveRecord::Base

  has_many :gifs
  has_many :games, through: :player_games

end
