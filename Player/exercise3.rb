require "./Player.rb"

Mario = Player.new

Mario.stats

count = 1

while count <=20
   Mario.collect_treasure
   count+=1
end

Mario.stats

count = 1

while count <=8
  Mario.do_battle
  count+=1
end

Mario.stats
