class Game < ActiveRecord::Base
  has_many :rounds
  has_many :players, through: :rounds
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
