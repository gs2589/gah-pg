class GamesController < ApplicationController
  def new
  end

  def create
   ## session[:username] = params[:username]
   ##@player=Player.find_or_create_by(username: params[:username])
    
session[:username] = params[:username]
@player=Player.find_or_create_by(username: params[:username])
session[:user_id] = @player.id
    

@game=Game.create()
session[:game_id]=@game.id
@game.players << @player # shovel all the player into the game that they specify
@player.starting_hand

round1 = Round.create(game_round: 1, game: @game)
round1.get_random_prompt

round2 = Round.create(game_round: 2, game: @game)
round2.get_random_prompt

round3 = Round.create(game_round: 3, game: @game)
round3.get_random_prompt

round4 = Round.create(game_round: 4, game: @game)
round4.get_random_prompt

round5 = Round.create(game_round: 5, game: @game)
round5.get_random_prompt

round6 = Round.create(game_round: 6, game: @game)
round6.get_random_prompt

round7 = Round.create(game_round: 7, game: @game)
round7.get_random_prompt

@a=game_path(@game)



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
      @round = @game.rounds.find_by(winner_id:nil)
      @prompt = @round.prompt

      @player = Player.find_by_id(session[:user_id])
      
      # Stuff that only needs to happen if there is a round

      if @round
        @prompt = @round.prompt
        # Determining the Judge
        if  @round.game_round == 1
          @judge = @game.players.uniq.sample
        else
          @judge = Round.find_by_id((@round.id) -1).winner
        end
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
