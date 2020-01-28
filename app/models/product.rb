class Product < ApplicationRecord

  belongs_to :supplier
  has_many :images
  has_many :orders

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: {maximum: 255}
  validates :description, length: {in: 10..500}
  # validates :description, length: { minimum: 10, maximum: 500 } fair alt to (in: 10..500)
  # validates :image_url, length: {maximum: 255}
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0, less_than: 99_999.99 }

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
