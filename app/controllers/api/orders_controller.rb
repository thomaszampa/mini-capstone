class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @order = current_user.orders
    render "index.json.jbuilder"
  end

  def create
    @order = Order.new(
      user_id: current_user.id
    )
    if @order.save
      carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")

      carted_products.each do |carted_product|
        carted_product.update(status: "purchased", order_id: @order.id)
      end

      @order.calculate_subtotal
      @order.calculate_tax
      @order.calculate_total

      render json: {message: "Product successfully ordered!"}
    else
      render json: {errors: @order.errors.full_messages}, status: :bad_request
    end
  end
end
