class GifsChannel < ApplicationCable::Channel
  def subscribed
    stream_from: 'gifs'
  end
end