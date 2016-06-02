class Round < ActiveRecord::Base
  belongs_to :game
  belongs_to :prompt
  has_many :players, through: :games
  has_many :players, through: :selections
  has_many :gifs, through: :players
  has_many :selections
  belongs_to :judge, class_name: "Player"
  belongs_to :winner, class_name: "Player"
  belongs_to :winning_gif, class_name: "Gif"


  def get_random_prompt()
    offset=rand(Prompt.count)
    if self.game.multiple_prompt_mode?
      offset2=rand(Prompt.count)
    else
      offset=rand(Prompt.count)
      self.prompt=Prompt.offset(offset).first
      self.save
    end
  end

  def self.currentround(game)
   game.rounds.select {|round| !round.winner_id.present?}.min_by(&:game_round)
  end

   def self.currentjudge(round)
    round.judge unless round == nil
   end


end
