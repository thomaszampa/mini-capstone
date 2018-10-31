class Api::CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    render "index.json.jbuilder"
  end

  def create
    @carted_product = CartedProduct.new(
      status: "carted",
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      order_id: ""
      )

    if @carted_product.save
      render json: {message: "Product successfully added to cart!"}
    else
      render json: {errors: @carted_product.errors.full_messages}, status: :bad_request
    end
  end
end
