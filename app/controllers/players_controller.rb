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


  def show
     @player = Player.find(params[:id])
  end


  def destroy
     Player.find(params[:id]).destroy
     flash[:success] = "User destroyed"
     redirect_to players_path
  end


  def edit
     @player = Player.find(params[:id])
     @title = "Edit Player"
  end


  def update
     @player = Player.find(params[:id])
     if @player.update_attributes(params[:player])
        redirect_to @player
     else
        @title = "Edit Player"
        render 'edit'
     end
  end

end


