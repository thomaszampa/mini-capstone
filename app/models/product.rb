class Product < ApplicationRecord
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