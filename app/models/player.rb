class Player < ActiveRecord::Base
  has_many :gifs
  has_many :player_round_gifs
  has_many :rounds, through: :player_round_gifs
  has_many :games, through: :rounds
  has_many :won_rounds, foreign_key: "winner_id"
  has_many :won_games, foreign_key: "champion_id"
  has_many :judged_games, foreign_key: "judge_id"

  def starting_hand
    self.gifs.delete_all
    8.times do
     self.gifs << Gif.random
   end 
 end

 
end

