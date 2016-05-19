class Game < ActiveRecord::Base
  has_many :rounds
  has_many :player_round_gifs, through: :rounds
  has_many :players, through: :player_round_gifs
  has_one  :champion, class_name: "Player"

  @prompt_mode=false

  def multiple_prompt_mode=(prompt_mode)
    #only prompt_mode=false is supported
    @prompt_mode=prompt_mode
  end

  def multiple_prompt_mode?()
    #only prompt_mode=false is supported
    @prompt_mode
  end



   

end
