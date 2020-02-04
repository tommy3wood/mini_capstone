class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

  has_many :carted_products
  has_many :users, through: :carted_products
  has_many :products, through: :carted_products

  def subtotal
    product.price * quantity.to_i
  end

  def tax
    subtotal * 0.09
  end

  def calculate_total
    subtotal + tax
  end

  def calculate_totals
    subtotal
    tax
    calculate_total
  end

  def calculate_subtotal
    sum = 0
    
    carted_products.index.each do |carted_product|
      sum += carted_product.product.price * carted_product.quantity
    end

    return sum
  end

end
