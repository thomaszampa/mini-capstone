class Api::SuppliersController < ApplicationController
  def index
    @supplier = Supplier.all

    search_input = params[:search]
    if search_input
      @supplier = @supplier.where("name ILIKE ?", "%#{search_input}%")
    end

    @supplier = @supplier.order(id: :asc)

    render "index.json.jbuilder"
  end

  def create
    @supplier = Supplier.new(
      name: params["name"],
      email: params["email"],
      phone_number: params["phone_number"],
      supplier_id: params["supplier_id"]
      )
    if @supplier.save
      render "show.json.jbuilder"
    else
      render json: {errors: @supplier.errors.full_messages}, status: 422
    end
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.name = params["name"] || @supplier.name 
    @supplier.email = params["email"] || @supplier.email 
    @supplier.phone_number = params["phone_number"] || @supplier.phone_number 
    @supplier.supplier_id = params["supplier_id"] || @supplier.supplier_id 
    if @supplier.save
      render "show.json.jbuilder"
    else
      render json: {errors: @supplier.errors.full_messages}, status: 422
    end
  end

  def destroy
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.destroy
    render json: {message: "supplier successfully destroyed!"}
  end
end