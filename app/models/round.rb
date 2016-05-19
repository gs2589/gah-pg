class Round < ActiveRecord::Base
  belongs_to :game
  has_many :player_round_gifs
  belongs_to :prompt
  has_one :judge, class_name: "Player"
  has_one :winner, class_name: "Player"
  has_one :winning_gif, class_name: "Gif"
  has_many :player_round_gifs
  has_many :players, through: :player_round_gifs
  has_many :gifs, through: :player_round_gifs




def get_random_prompt()

    offset=rand(Prompt.count)

    if self.game.multiple_prompt_mode?
    offset2=rand(Prompt.count)
      #return [Prompt.offset(offset).first, Prompt.offset(offset2).first ]
      #this feature is currently not supported
    else
      offset=rand(Prompt.count)

      require 'pry'
      binding.pry
      self.prompt=Prompt.offset(offset).first
      self.save
    end
  end








end