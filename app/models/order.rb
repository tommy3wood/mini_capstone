class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

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
end
