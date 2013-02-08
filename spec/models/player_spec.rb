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
end
