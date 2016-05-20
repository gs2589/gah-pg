require_relative('../lib/assets/prompts.rb')

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


BlackCards.each do |card|
    Prompt.create(phrase: card[:text], pick: card[:pick])
    end


new_game=Game.create()
new_round=Round.create(game: new_game)
player_1=Player.create()
player_2=Player.create()
new_game.players<<player_1
new_game.players<<player_2
new_round.judge=player_1
new_gif_1=Gif.random
new_gif_2=Gif.random
new_gif_3=Gif.random




#Prompts.each do |prompt|
  
