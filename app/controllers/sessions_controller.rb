class SessionsController < ApplicationController
  def create
    session[:username] = params[:username]
    @player=Player.find_or_create_by(username: params[:username])

    #existing game
    @game=Game.find(params[:existing_game_number])
    #@game.players<<@player
    redirect_to game_path(@game)

  end
end
