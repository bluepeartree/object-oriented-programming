class Vampire

@@coven = []

def initialize (name, age)
  @name = name
  @age = age
  @in_coffin = true
  @drank_blood_today = true
end

def in_coffin=(in_coffin)
  @in_coffin = in_coffin
end

def drank_blood_today=(drank_blood_today)
  @drank_blood_today = drank_blood_today
end

def drank_blood_today
  @drank_blood_today
end

def in_coffin
  @in_coffin
end


def self.create(name,age)
  new_vampire = Vampire.new(name, age)
  @@coven << new_vampire
  return new_vampire
end

def self.all
  @@coven
end

def drink_blood(vampire)
  @drank_blood_today = true
end

def self.sunset
    @@coven.map do |vampire|
      vampire.in_coffin = false
      vampire.drank_blood_today =false
    end
end

def go_home(vampire)
  @in_coffin = true
end

def self.sunrise
    @@coven = @@coven.select! do |vampire|
      vampire.drank_blood_today && vampire.in_coffin
    end
end

end

vlad = Vampire.create("Vlad", 700)
angel = Vampire.create("Angel", 500)
spike = Vampire.create("Spike", 200)

puts Vampire.all.inspect

Vampire.sunset

puts "Sunset" + Vampire.all.inspect

spike.drink_blood(spike)
spike.go_home(spike)

puts Vampire.all.inspect

Vampire.sunrise
puts "Sunrise" + Vampire.all.inspect

# Vampire.sunrise
# puts Vampire.all.inspect
