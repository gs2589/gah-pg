class Player < ActiveRecord::Base
  has_many :gifs
  has_many :games, through: :player_games
  has_many :games, foreign_key: "winner_id"
  # this winner / won games association may need to improve
end
