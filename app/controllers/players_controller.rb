class PlayersController < ApplicationController

  def index
    @title = "All Players"
    @players = Player.paginate(:page => params[:page]) 
  end

  def new
     @title = "New Player"
     @player = Player.new
  end

  def create
     @player = Player.new(params[:player])
     if @player.save
        flash[:success] = "Welcome to the Player App"
        redirect_to @player
     else
        @title = "New Player"
        render 'new'
     end
  end

end
