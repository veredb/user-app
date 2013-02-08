require 'spec_helper'

describe "Links" do

  it "should have a Index page at '/'" do
    get "/"
    response.should have_selector('title', :content => "All Players")
  end 


  it "should have a New page at 'players/new'" do
    get 'players/new'
    response.should have_selector('title', :content => "New Player")
  end

  
  describe "when not in New Player page" do

     it "should have a New Player link" do
        visit root_path
        response.should have_selector("a", :href => new_player_path,
                                           :content => "New_Player")
     end
  end

  describe "when in the New Player page" do
        before(:each) do
          @player = Factory(:player)
          visit new_player_path
          fill_in :playerID,     :with => @player.playerID
          fill_in :birthYear,  :with => @player.birthYear
          fill_in :nameFirst,  :with => @player.nameFirst
          fill_in :nameLast,  :with => @player.nameLast
          click_button
        end
        it "should have a All Players link" do
          visit new_player_path
          response.should have_selector("a", :href => players_index_path,
                                             :content => "All_Players")
        end
   end

  describe "when not in Show Player page" do

     it "should have a New Player link" do
        @player = Factory(:player)
        visit root_path
        response.should have_selector("a", :href => player_path(@player),
                                          :content =>  @player.playerID)
       
     end
  end

   describe "when in the Show Player page" do

       it "should have a All Players link" do
          @player = Factory(:player)
          visit player_path(@player)
          response.should have_selector("a", :href => players_index_path,
                                              :content => "All_Players")
          response.should have_selector("a", :href => edit_player_path,
                                              :content => "Edit_Player")
        end
    end


   describe "when not in Edit Player page" do
 
      it "should have a Edit Player link" do
         @player = Factory(:player)
         visit player_path(@player)
         response.should have_selector("a", :href => edit_player_path,
                                            :content => "Edit_Player")
      end
   end
 
   describe "when in the Edit Player page" do
         before(:each) do
           @player = Factory(:player)
           visit edit_player_path(@player)
           fill_in :playerID,     :with => @player.playerID
           fill_in :birthYear,  :with => @player.birthYear
           fill_in :nameFirst,  :with => @player.nameFirst
           fill_in :nameLast,  :with => @player.nameLast
           click_button
         end
         it "should have a the Player information" do
           @player = Factory(:player)
           visit player_path(@player)
           response.should have_selector("a", :href => players_index_path,
                                              :content => "All_Players")
           response.should have_selector("a", :href => edit_player_path,
                                              :content => "Edit_Player")
         end
    end
end
