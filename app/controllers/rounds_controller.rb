class RoundsController < ApplicationController


  def create
    puts ("I am the Rounds Controller Create")
    # create a new round
    # assign random prompt
    # assign judge
    # assign gifs, or replace gif or whatever
    # redirect or update or somehow communicate to game show this info
  end


  def update
    round = Round.find_by_id(params[:id])
    gif =  Gif.find_by_id(params[:round][:gif_id])
    round.winner = round.selections.find_by(gif_id:(gif.id)).player
    round.winning_gif = round.selections.find_by(gif_id:(gif.id)).gif
    round.winner.score += 1
    round.winner.save
    round.winning_gif_id=gif.id
    # Round.find_by_id((round.game_round)+1).judge = round.winner
    # Round.find_by_id((round.game_round)+1).save
    round.save
    redirect_to round.game

    # set winner id = to whatever is passed in
    # set winning gif id
    # Round.create? here, call rounds controller create action
    # redirect to

  end




end
