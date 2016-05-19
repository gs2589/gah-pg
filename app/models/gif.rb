class Gif < ActiveRecord::Base
  belongs_to :player

  require 'json'
  # attr_reader :url

  def self.random
   newgif = Gif.new
   newgif.url=JSON.load(open("http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC"))['data']['image_original_url']
   newgif.save
   newgif
 end

 def self.randomgif
   JSON.load(open("http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC"))['data']['image_original_url']
 end

end
