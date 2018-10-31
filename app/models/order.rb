class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products
  has_many :users, through: :carted_products

  def calculate_subtotal
    # carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")

    @calculated_subtotal = 0
    self.carted_products.each do |carted_product|
      @calculated_subtotal += carted_product.product.price * carted_product.quantity
    end
    update(subtotal: @calculated_subtotal)
  end

  def calculate_tax
    # carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")

    @calculated_tax = 0
    self.carted_products.each do |carted_product|
      @calculated_tax += carted_product.product.tax * carted_product.quantity
    end
    update(tax: @calculated_tax)
  end

  def calculate_total
    puts "-"*50
    p subtotal
    p tax
    puts "-"*50
    calculated_total = subtotal + tax
    update(total: calculated_total)
  end
end
