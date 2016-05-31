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

  def self.update_current_round(round, gif)
    round.winning_gif = round.selections.find_by(gif_id:(gif.id)).gif
    round.winner = round.winning_gif.player
    round.players.each { |player| player.db_starting_hand }
    round.winner.score += 1
    round.winner.save
  end


def self.initiate_rounds_for_game(game, number_of_rounds, judge_player)
  number_of_rounds.times do |i|
    Round.create(game_round: i, game: game, judge: judge_player).get_random_prompt if i==1
    Round.create(game_round: i, game: game).get_random_prompt if i>1
  end
end






  def self.setup_next_round(round, game)
    next_round = game.rounds.where(game_round: round.game_round+1).first
    next_round.judge = round.winner unless next_round == nil
    next_round.save unless next_round == nil
  end
end
