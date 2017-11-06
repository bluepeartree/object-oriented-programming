class Bankaccount

def initialize (balance)
  @balance = balance
  @interest_rate = 0.01
  amount = 0
end

#reader
def balance
  @balance
end

def interest_rate
  @interest_rate
end

#writer
def balance=(balance)
  @balance = balance
end

def interest_rate=(interest_rate)
  @interest_rate = interest_rate
end

#instance method
def deposit
  puts "How much would you like to deposit?"
  amount = gets.to_f
  @balance=@balance+amount
  puts "Your new balance is $#{ balance }."
end

def withdraw
  puts "How much would you like to withdraw?"
  amount = gets.to_f
  if @balance < amount
    puts "I am sorry, you do not have sufficient funds available."
  else
    @balance = @balance - amount
    puts "Your new balance is $#{ balance }."
  end
end

def balance_readout
  puts "Your balance is $#{ balance }."
end

def banking_decision
  puts "Which of the following would you like to do? withdraw/deposit/end"
    response = gets.chomp
    if response =="deposit"
      deposit
    elsif response == "withdraw"
      withdraw
    else
      puts "Thank you for doing business with us!. "
    end
end

def gain_interest
  puts "How many years have you held this money with us?"
  time = gets.to_f
  interest = 0
  interest = time * interest_rate * @balance
  puts "You have earned $#{ interest } in interest."
  @balance = @balance + interest
  puts "Your new balance is $#{ @balance }."
end

end
