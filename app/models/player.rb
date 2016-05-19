class Player < ActiveRecord::Base
  has_many :gifs
  has_many :games, through: :player_games
  has_many :games, foreign_key: "winner_id"
  # this winner / won games association may need to improve

  def starting_hand
    self.gifs.delete_all
    8.times do
     self.gifs << Gif.random
   end 
 end

 
end