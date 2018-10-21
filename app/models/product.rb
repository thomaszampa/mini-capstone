class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }

  def is_discounted?
    price > 10 && false
  end

  def tax
    @tax = price * 0.09
    return @tax
  end

  def total
    return @tax + price
  end
end