class Gif < ActiveRecord::Base
  belongs_to :player
  has_many :player_round_gifs
  has_many :won_rounds, foreign_key: "winning_gif_id"

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

 def self.welcome
   gifs = ['http://media3.giphy.com/media/btpKtFkGHi66k/giphy.gif',
            'http://media3.giphy.com/media/13x4ey4sju0V6E/giphy.gif',
            'http://media0.giphy.com/media/sp64EkjOxvY1W/giphy.gif',
            'http://media0.giphy.com/media/GGv8GTYHdT3bi/giphy.gif',
            'http://media0.giphy.com/media/cXqYZgplfOz1S/giphy.gif',
            'http://media1.giphy.com/media/b6Ie5mPADSmje/giphy.gif',
            'http://media2.giphy.com/media/R1Mvr97w9b5mw/giphy.gif',
            'http://media0.giphy.com/media/VWhCKTr9NhxbG/giphy.gif',
            'https://media1.giphy.com/media/Nyiv0I7uzXPZm/giphy.gif',
            'https://media.giphy.com/media/12mMxkzKzbxaLK/giphy.gif',
            'https://media.giphy.com/media/l0K41Ju0jBPuNxGIE/giphy.gif',
            'https://media.giphy.com/media/26vUBsNTnP1sD1tbW/giphy.gif',
            'https://media.giphy.com/media/R9rsJYJmYk4SY/giphy.gif',
            'https://media.giphy.com/media/3oGRFvVyUdGBZeQiAw/giphy.gif',
            'https://media.giphy.com/media/l3972sA1CU6Otys6s/giphy.gif',
            'https://media.giphy.com/media/3o7qDKsfM5x5BtLCJa/giphy.gif',
            'https://media.giphy.com/media/eYilisUwipOEM/giphy.gif',
            'http://media4.giphy.com/media/1KxUJONgu8tji/giphy.gif']
   gifs.shuffle.first
 end

end
