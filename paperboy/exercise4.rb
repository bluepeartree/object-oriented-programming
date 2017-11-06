require './paperboy.rb'

Newsie = Paperboy.new ("Satchel")
Newsie.quota
Newsie.report

rounds = 0

while rounds <5
  Newsie.deliver
  Newsie.report
  rounds +=1
end
