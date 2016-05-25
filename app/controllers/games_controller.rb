class GamesController < ApplicationController
  def new
  end

  def create
   ## session[:username] = params[:username]
   ##@player=Player.find_or_create_by(username: params[:username])
session[:username] = params[:username]
@player=Player.find_or_create_by(username: params[:username])
@player.score=0
session[:user_id] = @player.id


@game=Game.create()
session[:game_id]=@game.id
@game.players << @player # shovel all the player into the game that they specify
@player.db_starting_hand

10.times do |i|
  Round.create(game_round: i, game: @game, judge: @player).get_random_prompt if i==1
  Round.create(game_round: i, game: @game).get_random_prompt if i>1
end

# round1 = Round.create(game_round: 1, game: @game, judge: @player)
# round1.get_random_prompt
#
# round2 = Round.create(game_round: 2, game: @game)
# round2.get_random_prompt
#
# round3 = Round.create(game_round: 3, game: @game)
# round3.get_random_prompt
#
# round4 = Round.create(game_round: 4, game: @game)
# round4.get_random_prompt
#
# round5 = Round.create(game_round: 5, game: @game)
# round5.get_random_prompt
#
# round6 = Round.create(game_round: 6, game: @game)
# round6.get_random_prompt
#
# round7 = Round.create(game_round: 7, game: @game)
# round7.get_random_prompt




 render json: {game: game_path(@game)}

end




    # redirect_to game_path(@game)
    # Shovel 4 players into the game
    # generate n game rounds
    # Round.create x 4 (prompts and all that are generated)
    # now the game is ready to be played through all its rounds


    def show



      @game = Game.find_by_id(session[:game_id])

      (redirect_to(game_path(@game)) and return) if params[:id]!=@game.id.to_s

      @winnerless_rounds = @game.rounds.select {|round| !round.winner_id.present?}
      @round = @winnerless_rounds.min_by(&:game_round)


      @prompt = @round.prompt unless @round == nil

      @player = Player.find_by_id(session[:user_id])
      # Stuff that only needs to happen if there is a round

      if @round
        @prompt = @round.prompt
        # Determining the Judge
        # if @round.game_round == 1
          @judge = @round.judge
        # else
        #   @judge = Round.find_by_id((@round.id) -1).winner
        # end

        # Grabbing the selected gifs
          @selections = @round.selections
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
elsif @judge == @player
  render '_show_czar'
elsif @game.players.include?(@player) && !@round.selections.where(player: @player).any? && @round.selections.count == 0
  render '_show_player', notice: "winner stuff here"
elsif @game.players.include?(@player) && !@round.selections.where(player: @player).any? && @round.selections.count > 0
  render '_show_player_no_winner'
elsif @game.players.include?(@player) && @round.selections.where(player: @player).any? && !@round.winner.present?
  render '_show_player_waiting'
elsif @game.players.include?(@player) && @round.winner.present?
  render '_show_player_results'
else
  "You aren't in this game Bozo"
end

 end


 def results
   # custom get route bc show action only works for games w/o winners
   @player = Player.find_by_id(session[:user_id])
   @game = Game.find_by_id(params[:id])
  #  @round = @game.rounds.find_by(winner_id: nil) # need to fix this line

   # find earliest round with no assigned players, then subtract 1 from that
@playerless_rounds = @game.rounds.select {|round| !round.players.any?}
@earliest = @playerless_rounds.min_by(&:game_round)
if @earliest.game_round > 1
  @round = @game.rounds.find_by(game_round: (@earliest.game_round - 1))
else
  @round = @earliest
end

   @prompt = @round.prompt
   @selections = @round.selections
   @judge = @round.judge

   if @round.winner
     redirect_to @game
   else
     redirect_to @game
   end
 end

 def destroy
 end


end
