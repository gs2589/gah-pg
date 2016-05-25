class SessionsController < ApplicationController


  def create
    session[:username] = params[:username]

    cookies.signed[:username] = params[:username]

    @player=Player.find_or_create_by(username: params[:username])
        session[:user_id] = @player.id
    @player.score=0
    #existing game
    @game=Game.find_or_create_by(id: params[:existing_game_number])
    session[:game_id]=@game.id
    @game.players << @player # shovel all the player into the game that they specify
    @player.starting_hand
    @game.rounds.first.judge = @game.players.first
    @game.rounds.first.save

    redirect_to game_path(@game)
  end
end
