class Round < ActiveRecord::Base
  belongs_to :game
  has_many :player_round_gifs
  has_one :prompt
  has_one :judge, class_name: "Player"
  has_one :winner, class_name: "Player"
  has_one :winning_gif, class_name: "Gif"
  has_many :player_round_gifs
  has_many :players, through: :player_round_gifs
  has_many :gifs, through: :player_round_gifs

end