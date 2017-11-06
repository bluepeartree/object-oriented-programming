class BankAccount

  @@BankName="SharonBank"
  @@interest_rate = 0.01
  @@accounts = []
  @@total_funds=0

def initialize
  @balance = 0
end

def balance
  @balance
end

def balance=(balance)
  @balance=balance
end

def self.create
  new_account = BankAccount.new
  @@accounts << new_account
  return new_account
end

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

def self.total_funds
  count = 0
  @@total_funds = 0
  @@accounts.length.times do
    @@total_funds = @@total_funds + @@accounts[count].balance
    count +=1
  end
  return @@total_funds
end

def self.interest_time
  time = 1
  count = 0
  @@accounts.length.times do
    @@accounts[count].balance = @@accounts[count].balance + (@@accounts[count].balance * @@interest_rate * time)
    count +=1
  end
end

def self.get_accounts
  @@accounts
end

end

puts "Welcome! How many accounts would you like to open?"

accounts_list = gets.to_i
count = 0

while count < accounts_list
  new_account = BankAccount.create
  puts "Account number #{count+1} has been created."
  new_account.deposit
  new_account.withdraw
  count += 1
end

puts "The Bank has $#{ BankAccount.total_funds } in total."

puts "What about interest after 1 year?"

BankAccount.interest_time

puts "The Bank has $#{ BankAccount.total_funds } in total."
