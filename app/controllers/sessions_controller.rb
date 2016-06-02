class SessionsController < ApplicationController


  def create
    #if it comes from sign-in 
        #just sing user in
        if params[:commit]=="Sign-In"

            @member = Member.find_by(username: params[:member][:username])
            return head(:forbidden) unless @member.authenticate(params[:member][:password])
            session[:user_id] = @member.id
            session[:member]=is_member?
            redirect_to :root and return 
        end


        if params[:existing_game_number]
            session[:username] = params[:username]
            cookies.signed[:username] = params[:username]
            @player=GameCreator.new(params, session, is_member?).create_player_with_starting_hand
            session[:user_id] = @player.id

            @game=Game.find_or_create_by(id: params[:existing_game_number])
            session[:game_id]=@game.id
            @game.players << @player # shovel all the player into the game that they specify
            @player.db_starting_hand
            @game.rounds.first.judge = @game.players.first
            @game.rounds.first.save

            redirect_to game_path(@game)
        end  
    end

  def logout
        reset_session
        redirect_to '/'
    end


end
