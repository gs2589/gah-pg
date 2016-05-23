class Game < ActiveRecord::Base
  has_many :rounds
  has_many :game_players
  has_many :players, through: :game_players
  belongs_to  :champion, class_name: "Player"

  @prompt_mode=false

  def self.generate
    @game=Game.create()
    round1 = Round.create(game_round: 1, game: @game, judge: Player.find_by_id(1))
    round1.get_random_prompt

    round2 = Round.create(game_round: 2, game: @game,judge: Player.find_by_id(1))
    round2.get_random_prompt

    round3 = Round.create(game_round: 3, game: @game,judge: Player.find_by_id(1))
    round3.get_random_prompt

    round4 = Round.create(game_round: 4, game: @game, judge: Player.find_by_id(1))
    round4.get_random_prompt

    round5 = Round.create(game_round: 5, game: @game,judge: Player.find_by_id(1))
    round5.get_random_prompt

    round6 = Round.create(game_round: 6, game: @game,judge: Player.find_by_id(1))
    round6.get_random_prompt

    round7 = Round.create(game_round: 7, game: @game,judge: Player.find_by_id(1))
    round7.get_random_prompt
  end



  def multiple_prompt_mode=(prompt_mode)
    #only prompt_mode=false is supported
    @prompt_mode=prompt_mode
  end

  def multiple_prompt_mode?()
    #only prompt_mode=false is supported
    @prompt_mode
  end







end
