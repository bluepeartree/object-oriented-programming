class Product

  

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

def name=(name)
  @name=name
end

def base_price=(base_price)
  @base_price=base_price
end


def price_calc
  @total_price = @base_price + (@base_price*@tax_rate)
end

end

product1 = Product.new("Book", 20)
product2 = Product.new("Mop", 10)
product3 = Product.new("Laptop", 1500)
