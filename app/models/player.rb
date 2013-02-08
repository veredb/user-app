class Player < ActiveRecord::Base
  attr_accessible :birthYear, :nameFirst, :nameLast, :playerID

  validates :nameFirst, :presence => true, :length => { :maximum => 65 }
  validates :nameLast,  :presence => true, :length => { :maximum => 65 }
end
