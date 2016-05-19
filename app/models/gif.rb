class Gif < ActiveRecord::Base
  belongs_to :player
  has_many :player_round_gifs
  has_many :won_rounds, foreign_key: "winning_gif_id"
end
