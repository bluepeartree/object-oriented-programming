require './product.rb'

class Cart

@@Cart=[]

def initialize
  @total_before_tax = 0
  @total_after_tax = 0
end

def total_before_tax
  @total_before_tax
end

def total_after_tax
  @total_after_tax
end

def total_before_tax=(total_before_tax)
  @total_before_tax=total_before_tax
end

def total_after_tax=(total_after_tax)
  @total_after_tax=total_after_tax
end

def self.all
  @@Cart
end

def shopping_decision
puts "Welcome to Lame Store!"
puts "What would you like to do?"
puts "add item / remove item / leave"
response = gets.chomp
  if response == "add"
    add_to_cart
  elsif response == "remove" && @@Cart.length < 1
    puts "Your cart is already empty!"
  elsif response == "remove" && @@Cart.length >= 1
    remove_from_cart
  elsif response == "leave"
    puts "Thank you for your visit!"
  else
    puts "That is not a valid response."
  end
end

def add_to_cart
  puts "Our list of products is as follows:"
  Product.listings
  puts "What would you like to buy? "
  response = gets.chomp
  if Product.all_names.index(response)==nil
    puts "Sorry, product not found."
  else
    Product.all.each do |product|
      if product.name == response
        @@Cart << product
        puts @@Cart.inspect
      end
    end
  end
end

def remove_from_cart
  puts "What would you like to remove? "
  response = gets.chomp
  product_found = false
  Cart.all.each do |product|
      if product.name == response
        @@Cart.delete(product)
        puts @@Cart.inspect
        product_found = true
      end
      if product_found != true
        puts "That product is not in your cart!"
      end
    end
end

def self.pre_tax_calc
    @total_before_tax= 0
  @@Cart.each do |product|
    @total_before_tax = product.base_price + @total_before_tax
  end
  return @total_before_tax
end

def self.post_tax_calc
  @total_after_tax= 0
  @@Cart.each do |product|
    @total_after_tax = product.total_price + @total_after_tax
  end
  return @total_after_tax
end

end

new_cart = Cart.new

new_cart.shopping_decision
new_cart.shopping_decision
new_cart.shopping_decision
puts "Your bill before tax comes to $#{Cart.pre_tax_calc}."
puts "Your bill with tax comes to $#{Cart.post_tax_calc}."
