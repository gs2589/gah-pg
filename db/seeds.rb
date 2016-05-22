require_relative('../lib/assets/prompts.rb')

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


BlackCards.each do |card|
  if card[:pick] == 1
    Prompt.create(phrase: card[:text], pick: card[:pick])
  end
end





@game=Game.create()
player_1=Player.create(username: "robin")
player_2=Player.create(username: "erin")
player_3=Player.create(username: "mayank")
player_4=Player.create(username: "gabe")
@game.players<<player_1
@game.players<<player_2
@game.players<<player_3
@game.players<<player_4





#Prompts.each do |prompt|

