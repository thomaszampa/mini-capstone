class Api::ProductsController < ApplicationController
  def product_one_method
    @product = Product.first
    render "product_one.json.jbuilder"
  end

  def product_two_method
    @product = Product.second
    render "product_two.json.jbuilder"
  end

  def product_three_method
    @product = Product.third
    render "product_three.json.jbuilder"
  end

  def all_products_method
    @product = Product.all
    render "all_products.json.jbuilder"
  end
end
