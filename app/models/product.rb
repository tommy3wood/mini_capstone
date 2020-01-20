class Product < ApplicationRecord

def is_discounted?
  price < 100
end

def tax
  price * 0.09
end

def total_price
  tax + price
end

end
