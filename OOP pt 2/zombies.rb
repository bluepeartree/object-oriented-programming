require "pp"

class Zombie

@@horde = []
@@plague_level = 10
@@max_speed = 5
@@max_strength = 5
@@default_speed = 1
@@default_strength = 3

def initialize (speed, strength)
  if speed > @@max_speed
    @speed = @@default_speed
  else
    @speed = speed
  end
  if strength > @@max_strength
    @strength = @@default_strength
  else
    @strength = strength
  end
end

def speed
  @speed
end

def strength
  @strength
end

def speed=(speed)
  @speed = speed
end

def strength=(strength)
  @strength = strength
end

def self.all
  @@horde
end

def self.spawn
  spawn = rand (1..@@plague_level)
  count = 1
  while count <= spawn
    strength = rand(1..@@max_strength)
    speed = rand(1..@@max_speed)
    Zombie.create(speed, strength)
    count +=1
  end
end

def self.create(speed, strength)
  new_zombie = Zombie.new(speed, strength)
  @@horde << new_zombie
  return new_zombie
end

def self.increase_plague_level
  @@plague_level = @@plague_level + rand(0..2)
end

def self.some_die_off
  death=rand(0..10)
  if death > @@horde.length
    death = @@horde.length
  end
  @@horde.slice!(0..death)
end

def self.new_day
  spawn
  increase_plague_level
  some_die_off
end


def encounter(attacker)
  return "No Zombies! Lucky you!" unless attacker
  if outrun_zombie?(attacker.speed) && survive_attack?(attacker.strength)
    puts "You escaped!"
  elsif outrun_zombie?(attacker.speed) == false && survive_attack?(attacker.strength)
    you = Zombie.new(5,5)
    @@horde << you
    puts "You are now a zombie. Welcome to the zombie horde!"
  else
    puts "The zombie killed you :-( "
  end
end

def outrun_zombie?(zombie_speed)
  your_speed = rand(1..@@max_speed)
  your_speed > zombie_speed
end

def survive_attack?(zombie_strength)
  your_strength = rand(1..@@max_strength)
  your_strength > zombie_strength
  # if your_strength > zombie_strength
  #   true
  # else
  #   false
  # end
end

end

def exec
  Zombie.spawn
  pp Zombie.all
  Zombie.new_day
  pp Zombie.all

  attacker = Zombie.all.sample

  # attacker&.encounter(attacker)
  # attacker && attacker.encounter(attacker)
  attacker ? attacker.encounter(attacker) : (puts "No Zombies!")
  gets
end

loop {exec}
