class Api::OrdersController < ApplicationController
  def index
    @order = Order.all
    render json: {orders: }
  end

  def create
    product = Product.find_by(id: params[:product_id])
    @order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: product.price * params["quantity"].to_i,
      tax: params["quantity"] * product.tax,
      total: product.price * params["quantity"].to_i + product.tax,
      )
    if @order.save
      render json: {message: "Product successfully ordered!"}
    else
      render json: {errors: order.errors.full_messages}, status: :bad_request
    end
  end

  def show
  end

  def update
  end
end
