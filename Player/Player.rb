class Player

def initialize
  @gold_coins = 0
  @health_points = 10
  @lives = 5
end

def gold_coins
  @gold_coins
end

def health_points
  @health_points
end

def lives
  @lives
end

def gold_coins=(gold_coins)
  @gold_coins=gold_coins
end

def health_points=(health_points)
  @health_points=health_points
end

def lives=(lives)
  @lives=lives
end

def level_up
  @lives +=1
end

def collect_treasure
  @gold_coins+=1
  if @gold_coins % 10== 0
    level_up
  end
end

def do_battle
  puts "Damage received? "
  damage = gets.to_i
  @health_points=@health_points-damage
  if @health_points < 1
    @lives += -1
    @health_points = 10
  end
  if lives < 0
    restart
  end
end

def restart
  @gold_coins = 0
  @health_points = 10
  @lives = 5
end

def stats
  puts "Gold coins : #{ @gold_coins }"
  puts "Health Points: #{ @health_points }"
  puts "Lives: #{ @lives }"
end

end
