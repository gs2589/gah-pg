class GamesController < ApplicationController
  


  def create
   
    session[:username] = params[:username]
    @player=Player.find_or_create_by(username: params[:username])
    @player.score=0
    session[:user_id] = @player.id
    @game=Game.create()
    session[:game_id]=@game.id
@game.players << @player # shovel all the player into the game that they specify
@player.db_starting_hand
Round.initiate_rounds_for_game(@game, 10, @player)
render json: {game: game_path(@game)}

end


def show
  game_session = [session[:game_id],session[:user_id]]
  @game = Game.currentgame(params[:id])
  @player = Player.currentplayer(game_session[1])
  (redirect_to(game_path(@game)) and return) if params[:id]!=@game.id.to_s
  @round = Round.currentround(@game)
  @prompt = Prompt.currentprompt(@round)
  @judge = Round.currentjudge(@round)
  @selections = Selection.currentselections(@round)
  @gifs = Gif.currentgifs(@judge,@selections,@player)
  if @round == nil
    render '_game_over'
  elsif @judge == @player
    render '_show_czar'
  elsif @game.players.include?(@player) && !@round.selections.where(player: @player).any? && @round.selections.count == 0
    render '_show_player', notice: "winner stuff here"
  elsif @game.players.include?(@player) && !@round.selections.where(player: @player).any? && @round.selections.count > 0
    render '_show_player_no_winner'
  elsif @game.players.include?(@player) && @round.selections.where(player: @player).any? && !@round.winner.present?
    render '_show_player_waiting'
  elsif @game.players.include?(@player) && @round.winner.present?
    render '_show_player_results'
  else
    "You aren't in this game Bozo"
  end
end







end
