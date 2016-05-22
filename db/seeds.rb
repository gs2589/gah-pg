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

round1 = Round.create(game_round: 1, game: @game, judge: Player.find_by_id(1))
round1.get_random_prompt

round2 = Round.create(game_round: 2, game: @game)
round2.get_random_prompt

round3 = Round.create(game_round: 3, game: @game)
round3.get_random_prompt

round4 = Round.create(game_round: 4, game: @game)
round4.get_random_prompt

round5 = Round.create(game_round: 5, game: @game)
round5.get_random_prompt

round6 = Round.create(game_round: 6, game: @game)
round6.get_random_prompt

round7 = Round.create(game_round: 7, game: @game)
round7.get_random_prompt



#Prompts.each do |prompt|

