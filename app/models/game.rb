class Game < ActiveRecord::Base
  has_many :rounds
  has_many :game_players
  has_many :players, through: :game_players
  belongs_to  :champion, class_name: "Player"

  @prompt_mode=false

  def self.generate
    @game=Game.create()
    round1 = Round.create(game_round: 1, game: @game)
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
