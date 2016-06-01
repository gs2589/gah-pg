class RoundsController < ApplicationController
  def update
    round = Round.find_by_id(params[:id])
    gif = Gif.find_by_id(params[:round][:gif_id])
    game = round.game

    Round.update_current_round(round, gif)
    Round.setup_next_round(round, game)

    if round.save
      ActionCable.server.broadcast 'selections',
         data: "no data being sent",
         game: game.id
    end

    flash[:notice] = "#{round.winner.username} won the game!"
    redirect_to game
  end
end
