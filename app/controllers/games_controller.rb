class GamesController < ApplicationController



  def create
    @game=GameCreator.new(params, session, is_member?).create_game_with_first_player
    session[:user_id] = @game.players.first.id
    session[:game_id]=@game.id
    render json: {game: game_path(@game)}
  end


  def show

    @game = Game.find(params[:id])
    @player = Player.find(session[:user_id])
    (redirect_to(game_path(@game)) and return) if params[:id]!=@game.id.to_s
    @round = Round.currentround(@game)
    @prompt = Prompt.currentprompt(@round)
    @judge = Round.currentjudge(@round)
    @selections = Selection.currentselections(@round)
    @gifs = Gif.currentgifs(@judge,@selections,@player)
    if @round == nil   
      render 'game_over'
    elsif @judge == @player  
      render 'show_judge'    
    elsif @game.has_player?(@player)
      if @round.selections.count == 0
        render 'show_player_with_winner'
      elsif  !@player.has_selected?(@round) 
        render 'show_player_no_winner'
      elsif   @player.has_selected?(@round) && !@round.winner.present?
        render 'show_player_waiting'
      end
    end
  end







end
