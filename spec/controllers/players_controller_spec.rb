require 'spec_helper'
require 'factory_girl'
#Factory.find_definitions
require 'factories'
describe PlayersController do

  render_views

  describe "GET 'index'" do

    before(:each) do
      @player = Factory(:player)
      second = Factory(:player, :playerID => "name2")
      third = Factory(:player, :playerID => "name3")

      @players = [@player, second, third]
       
      30.times do
         @players << Factory(:player, :playerID => Factory.next(:playerID))
      end
     end


    it "returns http success" do
      get :index
      response.should be_success
    end

    it "should have the right title" do
       get :index
       response.should have_selector("title", :content => "All Players")
    end

   it "should have an element for each player" do
       get :index
       @players[0..2].each do |player|
          response.should have_selector("li", :content => player.playerID)
       end
    end

    it "should paginate players" do
        get :index
        response.should have_selector("div.pagination")
        response.should have_selector("span.disabled", :content => "Previous")
     end

  end

  describe "GET 'new'" do

    it "should be successful" do
      get :new
      response.should be_success
    end

    it "returns http success" do
      get :new
      response.should be_success
    end

    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => "New Player")
    end
  end


  describe "POST 'create'" do
   
    describe "success" do
       before(:each) do
          @attr = { :playerID => "New Player", :birthYear => 1987, :nameFirst => "foo", :nameLast => "bar" }
       end
       it "should create a player" do
          lambda do
             post :create, :player => @attr
          end.should change(Player, :count).by(1) 
       end
    
       it "should redirect to the player show page" do
          post :create, :player => @attr
          response.should redirect_to(player_path(assigns(:player)))
       end
    end

    describe "failure" do
       before(:each) do
          @attr = { :playerID => "", :birthYear => "", :nameFirst => "", :nameLast => "" }
       end

       it "should not create a player" do
          lambda do
             post :create, :player => @attr
          end.should_not change(Player, :count) 
       end

       it "should have the right title" do
          post :create, :player => @attr
          response.should have_selector("title", :content => "New Player")
       end
     
       it "should render the 'new' page" do
          post :create, :player => @attr
          response.should render_template('new')
       end
    end
  end



  describe "GET 'show'" do

    before(:each) do
      @player = Factory(:player)
    end

    it "should be successful" do
        get :show, :id => @player
        response.should be_success
    end

    it "should find the right player" do
         get :show, :id => @player
         assigns(:player).should == @player
    end

    it "should include the player's name" do
         get :show, :id => @player
         response.should have_selector("h1", :content => @player.nameLast)
    end 
  end


  
  describe "DELETE 'destroy'" do

     before(:each) do
       @player = Factory(:player)
     end


     it "should destroy the player" do
        lambda do
           delete :destroy, :id => @player
        end.should change(Player, :count).by(-1)
     end

     it "should redirect to the players page" do
        delete :destroy, :id => @player
        response.should redirect_to(players_path)
     end
  end


  
  describe "GET 'edit'" do

     before(:each) do
       @player = Factory(:player)
     end


     it "should be successful" do
       get :edit, :id => @player
       response.should be_success
     end

     it "should have the right title" do
        get :edit, :id => @player
        response.should have_selector("title", :content => "Edit Player")
     end
  end



  describe "PUT 'update'" do
     before(:each) do
       @player = Factory(:player)
     end

     describe "success" do
       before(:each) do
        @attr = { :playerID => "newplayer01", :birthYear => 1987, :nameFirst => "foo", :nameLast => "bar" }
       end

       it "should change the user's attributes" do
          put :update, :id => @player, :player => @attr
          @player.reload
          @player.playerID.should == @attr[:playerID]
          @player.birthYear.should == @attr[:birthYear]
          @player.nameFirst.should == @attr[:nameFirst]
          @player.nameLast.should == @attr[:nameLast]
       end

       it "should redirect to the user show page" do
          put :update, :id => @player, :player => @attr
          response.should redirect_to(player_path(@player))
       end
     end

     describe "failure" do
       before(:each) do
        @attr = { :playerID => "", :birthYear => "", :nameFirst => "", :nameLast => "" }
       end

       it "should render the 'edit' page" do
         put :update, :id => @player, :player => @attr
         response.should render_template('edit')
       end

       it "should have the right title" do
         put :update, :id => @player, :player => @attr
         response.should have_selector("title", :content => "Edit Player")
       end
     end
      
  end
  

end
