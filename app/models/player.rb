class Player < ActiveRecord::Base
  has_many :gifs
  has_many :game_players
  has_many :games, through: :game_players
  has_many :rounds, through: :game_players
  has_many :selections
  has_many :won_rounds, foreign_key: "winner_id"
  has_many :won_games, foreign_key: "champion_id"

  # has_many :judged_rounds, foreign_key: "judge_id", class_name: "Round"

  def starting_hand
    self.gifs.delete_all
    10.times do
     self.gifs << Gif.random

   end
   self.save
 end





end
