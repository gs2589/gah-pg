class GameCreator 


  def initialize(payload)
    @payload=payload
  end

  def create_game_with_first_player  
    player= create_player_with_starting_hand
    game=Game.create()
    game.players << player  # shovel all the player into the game that they specify
    
    Round.initiate_rounds_for_game(game, 10, player)
    game
  end


  def create_player_with_starting_hand
    @player=Player.find_or_create_by(username: @payload[:username])
    @player.score=0
    @player.db_starting_hand
    @player
  end





end