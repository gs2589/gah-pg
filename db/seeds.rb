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
player_3=Player.create()
new_game.players<<player_1
new_game.players<<player_2
new_game.players<<player_3
new_round.judge=player_1
new_gif_1=Gif.random
new_gif_2=Gif.random
new_gif_3=Gif.random
new_round_selection_1=Selection.create(player: player_1, round: new_round, selected_gif: new_gif_1)
new_round_selection_2=Selection.create(player: player_2, round: new_round, selected_gif: new_gif_2)
new_round_selection_3=Selection.create(player: player_3, round: new_round, selected_gif: new_gif_3)







#Prompts.each do |prompt|
  
