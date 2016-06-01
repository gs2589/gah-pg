class RoundsController < ApplicationController
  def update
    round = Round.find_by_id(params[:id])
    gif = Gif.find_by_id(params[:round][:gif_id])
    game = round.game
    RoundUpdater.new(round, gif).update

    if round.save
      ActionCable.server.broadcast 'selections',
        data: "no data being sent",
        game: game.id
    end

    redirect_to round.game
  end

end
