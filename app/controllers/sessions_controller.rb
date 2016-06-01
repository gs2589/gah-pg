class SessionsController < ApplicationController


  def create
    session[:username] = params[:username]
    cookies.signed[:username] = params[:username]
    @player=GameCreator.new(params).create_player_with_starting_hand
    session[:user_id] = @player.id
    
    @game=Game.find_or_create_by(id: params[:existing_game_number])
    session[:game_id]=@game.id
    @game.players << @player # shovel all the player into the game that they specify
    @player.db_starting_hand
    @game.rounds.first.judge = @game.players.first
    @game.rounds.first.save

    redirect_to game_path(@game)
  end
end
