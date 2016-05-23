class GamesController < ApplicationController
  def new
  end

  def create
    @game=Game.create()
    round1 = Round.create(game_round: 1, game: @game, judge: Player.find_by_id(1))
    round1.get_random_prompt

    round2 = Round.create(game_round: 2, game: @game,judge: Player.find_by_id(1))
    round2.get_random_prompt

    round3 = Round.create(game_round: 3, game: @game,judge: Player.find_by_id(1))
    round3.get_random_prompt

    round4 = Round.create(game_round: 4, game: @game, judge: Player.find_by_id(1))
    round4.get_random_prompt

    round5 = Round.create(game_round: 5, game: @game,judge: Player.find_by_id(1))
    round5.get_random_prompt

    round6 = Round.create(game_round: 6, game: @game,judge: Player.find_by_id(1))
    round6.get_random_prompt

    round7 = Round.create(game_round: 7, game: @game,judge: Player.find_by_id(1))
    round7.get_random_prompt
  end
    # redirect_to game_path(@game)
    # Shovel 4 players into the game
    # generate n game rounds
    # Round.create x 4 (prompts and all that are generated)
    # now the game is ready to be played through all its rounds

    def show
      @game = Game.find_by_id(params[:id])
      @round = Round.find_by(winner_id: nil)
      @prompt = @round.prompt
      @player = Player.find_by_id(session[:user_id])
      @game = Game.find_by_id(params[:id])
      @round = @game.rounds.find_by(winner_id: nil)
      # Stuff that only needs to happen if there is a round

      if @round
        @prompt = @round.prompt
        # Determining the Judge

      if @round.game_round == 1
        @judge = Player.first
      else
        @judge =  Round.find_by_id((@round.id) -1).winner 
      end

       # Assigning the correct gifs
      if @judge == @player
        @gifs =@round.selections.map do |selection|
          selection.gif
        end
      else
        @gifs =  @player.gifs
      end
    # end
# Redirections
if @round == nil
  render '_game_over'
elsif  @judge == @player
  render '_show_czar'
elsif @game.players.include?(@player)
  render '_show_player'
else
  "You aren't in this game Bozo"
end

 end

 def destroy
 end


end
