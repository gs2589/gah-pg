class Prompt < ActiveRecord::Base
  has_many :rounds

  def self.working_random_prompt
    x =  Prompt.all[rand(1..(Prompt.count))]
    if x.pick == 1
     return x
     else
     Prompt.working_random_prompt
     end
  end
end
