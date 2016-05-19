class SessionsController < ApplicationController
  def create
    session[:username] = params[:username]
    @player=Player.find_or_create_by(username: params[:username])
        session[:user_id] = @player.id
    #existing game
    @game=Game.find(params[:existing_game_number])
    #@game.players<<@player
    redirect_to game_path(@game)
    binding.pry
  end
end
