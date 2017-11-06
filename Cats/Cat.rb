class Cat

def initialize (name)
  @name =name
  @preferred_food = preferred_food
  @meal_time = meal_time
end

def name
  @name
end

def preferred_food
  @preferred_food
end

def meal_time
  @meal_time
end

def name=(name)
  @name = name
end

def meal_time=(meal_time)
  @meal_time = meal_time
end

def preferred_food=(preferred_food)
  @preferred_food = preferred_food
end

def eats_at
  if @meal_time>12
    "#{ @meal_time-12 } PM."
  else
    "#{ @meal_time} AM."
  end
end

def meow
  puts "My name is #{ @name } and I eat #{@preferred_food} at #{ eats_at} "
end

end
