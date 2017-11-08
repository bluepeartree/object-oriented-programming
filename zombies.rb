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
  @@horde << self
end

def self.all
  @@horde
end



end
