require './Cat.rb'

kitty = Cat.new("Patches")
kitty.preferred_food = "tuna"
kitty.meal_time = 23

tom = Cat.new("Professor Meow")
tom.preferred_food = "caviar"
tom.meal_time = 2

kitty.eats_at
tom.eats_at

kitty.meow
tom.meow
