class SelectionsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'selections'
  end

  # def select_gif gif
  #   ActionCable.server.broadcast('gifs', 
  #     gif: render_gif(gif) )
  # end

  # private
  # def render_gif gif
  #   ApplicationController.render(partial: 'gifs/gif',
  #                                locals: {gif: gif})
  # end
end