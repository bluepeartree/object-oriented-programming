class Paperboy

def initialize (name)
  @name = name
  @experience = 0
  @earnings = 0
  @min = 50
  @quota = 0
end

def name
  @name
end

def experience
  @experience
end

def earnings
  @earnings
end

def name=(name)
  @name=name
end

def experience=(experience)
  @experience=experience
end

def earnings=(earnings)
  @earnings=earnings
end

def quota
  @quota = @min + (@experience/2)
end

def deliver
  puts "What house number did you start at?"
  start_address = gets.to_i
  puts "What house number did you end at?"
  end_address = gets.to_i
    if end_address > start_address
      current_experience = end_address-start_address
      if current_experience < @quota
        payment = (current_experience * 0.25) - 2
      else
        payment = (@quota * 0.25) + ((current_experience-@quota)*0.50)
      end
      @earnings = @earnings + payment
      @experience=@experience + current_experience
      quota
    else
      puts "Sorry, that doesn't make sense."
      deliver
    end
    return payment
end

def report
  puts "Hi, my name is #{ @name }, I've delivered #{ @experience } papers and I've earned $#{ @earnings } so far!
  My quota is #{ @quota } papers per round!"
end

end
