class Product

@@Product_list =[]
@@Product_list_names =[]

def initialize (name, base_price)
  @name = name
  @base_price = base_price
  @tax_rate = 0.13
  @total_price = 0
end

def name
  @name
end

def base_price
  @base_price
end

def tax_rate
  @tax_rate
end

def total_price
  @total_price
end



def name=(name)
  @name=name
end

def base_price=(base_price)
  @base_price=base_price
end

def self.listings
  @@Product_list.each do |item|
    puts "Item name: #{item.name}"
    puts "Price: $#{item.base_price}"
  end
end


def self.create(name, price)
  new_product = Product.new(name, price)
  @@Product_list << new_product
  @@Product_list_names << new_product.name
  return new_product
end

def self.all
  @@Product_list
end

def self.all_names
  @@Product_list_names
end

def total_price=(total_price)
  @total_price = @base_price + (@base_price*@tax_rate)
end

end

Product.create("Book", 20)
Product.create("Mop", 10)
Product.create("Laptop", 1500)
#
# puts Product.all.inspect
# puts Product.all_names.inspect
# Product.listings

# puts Product.all[0].name
