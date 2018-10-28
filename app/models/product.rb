class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }

  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # def images
  #   Image.where(product_id: id)
  # end

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

  def image_url_list
    # list = []
    # images.each do |image|
    #   list << image.url
    # end
    # list
    images.map { |image| image.url }
  end
end