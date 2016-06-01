class RoundsController < ApplicationController
  def update
    round = Round.find_by_id(params[:id])
    gif = Gif.find_by_id(params[:round][:gif_id])
    RoundUpdater.new(round, gif).update

    if round.save
      ActionCable.server.broadcast 'selections',
        data: "no data being sent",
        game: game.id
    end
    
    redirect_to game
  end
end
