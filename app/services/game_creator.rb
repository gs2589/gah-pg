class GameCreator 


  def initialize(payload)
    @payload=payload
  end

  def create_game_with_first_player  
    player= create_player_with_starting_hand
    game=Game.create()
    game.players << player
    Round.create(game_round: 1, game: game, judge: player).get_random_prompt
    game
  end


  def create_player_with_starting_hand
    @player=Player.find_or_create_by(username: @payload[:username])
    @player.score=0
    @player.db_starting_hand
    @player
  end





end