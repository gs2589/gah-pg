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



   def get_random_prompt()

    offset=rand(Prompt.count)

    if self.multiple_prompt_mode?
    offset2=rand(Prompt.count)
      #return [Prompt.offset(offset).first, Prompt.offset(offset2).first ]
      #this feature is currently not supported
    else
      offset=rand(Prompt.count)
      self.prompt=Prompt.offset(offset).first
      self.save
    end
  end

end
