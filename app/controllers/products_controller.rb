class ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.html.erb"
  end

  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"].to_i,
      description: params["description"],
      supplier_id: params["supplier_id"].to_i
      )
    if @product.save
      Image.create(
        url: params[:image_url],
        product_id: @product.id
        )
      redirect_to "/products/#{@product_id}"
    else
      render json: {errors: @product.errors.full_messages}, status: 422
    end  
  end

  def new
    render "new.html.erb"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end
end
