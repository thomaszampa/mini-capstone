class Api::ProductsController < ApplicationController
  def index
    @product = Product.all

    search_input = params[:search]
    if search_input
      @product = @product.where("name ILIKE ?", "%#{search_input}%")
    end

    @product = @product.order(id: :asc)

    render "index.json.jbuilder"
  end

  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      description: params["description"]
      )
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: 422
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params["name"] || @product.name 
    @product.price = params["price"] || @product.price 
    @product.description = params["description"] || @product.description 
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: 422
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "Product successfully destroyed!"}
  end
end