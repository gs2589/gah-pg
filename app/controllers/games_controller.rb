class GamesController < ApplicationController
  def new
  end

  def create
    # Shovel 4 players into the game
    # generate n game rounds
    # Round.create x 4 (prompts and all that are generated)
    # now the game is ready to be played through all its rounds
  end

  def show
    # get round #
      # if judge for that round
        # render judge partial 
        # judge crowns winner (POST to round#update)

      # if player for that round
        # render player partial
        # players make selections (POST to selections.create)
  end

  def destroy
  end


end
