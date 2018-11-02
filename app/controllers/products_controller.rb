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
    @suppliers = Supplier.all
    render "new.html.erb"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @suppliers = Supplier.all
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params["name"]
    @product.price = params["price"].to_i
    @product.description = params["description"]
    @product.supplier_id = params["supplier_id"].to_i
    @product.save
    redirect_to "/products/#{@product_id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to "/products"    
  end
end
