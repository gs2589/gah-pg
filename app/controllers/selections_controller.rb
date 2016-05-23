class SelectionsController < ApplicationController
  def new
    render nothing: true
  end

  def create
    # player posts selection here
    # assign player, gif, round all those ids to the selection and save to DB
    @round =  Round.find_by_id(params[:round_id])
    @round_for_prompt = Round.find_by(winner_id: nil)
    @prompt = @round_for_prompt.prompt
    @gifs =  [Gif.find_by_id(params[:selection][:gif_id])]
    @player = Player.find_by_id(session[:user_id])
    
    #Random Instance Variables setting
    #@prompt = Prompt.last
      if @round_for_prompt.game_round == 1
        @judge = Player.first
      else
        @judge = Round.find_by_id((@round_for_prompt.id) -1).winner 
      end
    #@judge = Player.last
    already_submitted = @round.selections.map do |selection|
      selection[:player_id]
    end  

    #I think this is where we want the broadcast to happen
    # ActionCable.server.broadcast 'gifs',
    #   gifs: @player.gifs
    # #head :ok 

    if already_submitted.include?(@player.id) == false
      selected_gif =  Selection.create(gif: @gif, player: @player, round: @round)
      ActionCable.server.broadcast 'gifs',
        gif_id: selected_gif.gif.id,
        selection: selected_gif.id,
        gif_url: selected_gif.gif.url
      head :ok
      #redirect_to round.game
      # render 'games/_show_czar'
    else
      #redirect_to round.game
      # render 'games/_show_czar'
    end

  end

  def show
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
