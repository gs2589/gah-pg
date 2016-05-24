class SelectionsController < ApplicationController
  def new
    render nothing: true
  end

def create
    # player posts selection here
    # assign player, gif, round all those ids to the selection and save to DB
    round =  Round.find_by_id(params[:round_id])
    gif =  Gif.find_by_id(params[:selection][:gif_id])
    player = Player.find_by_id(session[:user_id])
    already_submitted = round.selections.map do |selection|
      selection[:player_id]
    end  

    if already_submitted.include?(player.id) == false
      @selection=Selection.new(gif: gif, player: player, round: round)
      if @selection.save
      ActionCable.server.broadcast 'selections',
        gif: @selection.gif,
        player: @selection.player,
        round: @selection.round,
        game: @selection.round.game
      #head :ok
      # broadcast this selection to EVERYONE who is looking at the judges show page
      end
      
      redirect_to round.game
    end
  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
