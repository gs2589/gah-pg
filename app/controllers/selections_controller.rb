class SelectionsController < ApplicationController

  def create
    round =  Round.find_by_id(params[:round_id])
    gif =  Gif.find_by_id(params[:selection][:gif_id])
    player = Player.find_by_id(session[:user_id])
    already_submitted = round.selections.map do |selection|
      selection[:player_id]
    end  

    if already_submitted.include?(player.id) == false
      @selection = Selection.new(gif: gif, player: player, round: round)
      if @selection.save
        ActionCable.server.broadcast 'selections',
          gif: @selection.gif,
          player: @selection.player,
          round: @selection.round,
          game: @selection.round.game.id
      end
      redirect_to round.game
    end
  end

end
