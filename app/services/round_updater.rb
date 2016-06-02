class RoundUpdater
  attr_accessor :round, :gif, :game

  def initialize(round, gif)
    @round = round
    @gif = gif
    @game = round.game
  end

  def update
    update_current_round
    setup_next_round
  end

  def update_current_round
    round.winning_gif = round.selections.find_by(gif_id:(gif.id)).gif
    round.winner = round.winning_gif.player
    round.players.each { |player| player.db_starting_hand }
    round.winner.score += 1
    round.winner.save
  end

  def setup_next_round
    Round.create(game_round: (round.game_round) +1, game: game).get_random_prompt
    next_round =  game.rounds.last
    next_round.judge = round.winner unless nil
    next_round.save unless next_round == nil
  end
end
