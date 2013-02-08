Factory.define :player do |player|
  player.playerID     "Mozo001"
  player.birthYear     1987
  player.nameFirst    "Mozo"
  player.nameLast     "rok"
end

Factory.sequence :playerID do |n|
 "<a>person-#{n}</a>"
end
