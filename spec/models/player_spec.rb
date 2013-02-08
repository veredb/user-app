require_relative '../spec_helper'

describe Player do
  pending "add some examples to (or delete) #{__FILE__}"
end


describe Player do

  before(:each) do
     @attr = { :playerID => "aaronha01", :birthYear => 1934, :nameFirst => "Hank", :nameLast => "Aaron" }
  end

  it "should create a new instance given valid attributes" do
     Player.create!(@attr)
  end

  #   validation tests

  it "should require a nameLast" do
       no_name_player = Player.new(@attr.merge(:nameLast => ""))
       no_name_player.should_not be_valid 
   end 

  it "should require a nameFirst" do
       no_name_player = Player.new(@attr.merge(:nameFirst => ""))
       no_name_player.should_not be_valid 
   end 

   it "should reject names that are too long" do
       long_name = "a" * 66
       long_name_player = Player.new(@attr.merge(:nameLast => long_name))
       long_name_player.should_not be_valid
   end
end
