class Api::SuppliersController < ApplicationController

  def index
    search_term = params[:search]
    discount_search = params[:discount]
    sort_action = params[:sort]
    sort_order = params[:sort_order]
    @suppliers = Supplier.all

    if search_term
      @suppliers = @suppliers.where("name iLIKE ?", "%#{search_term}%")
    end

    if discount_search == "true"
      @suppliers = @suppliers.where("price < ?", 100)
    end

    if sort_order && sort_action
      @suppliers = @suppliers.order(sort_action => sort_order)
    elsif sort_action
      @suppliers = @suppliers.order(sort_action)
    else
      @suppliers = @suppliers.order(id: :asc)
    end

    render 'index.json.jb'
  end

  def create
        @supplier = Supplier.new(
                name: params[:name],
                email: params[:email],
                phone_number: params[:phone_number]
                )
    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @supplier = Supplier.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @supplier = Supplier.find(params[:id])

    @supplier.name = params[:name] || @supplier.name
    @supplier.email = params[:email] || @supplier.email
    @supplier.phone_number = params[:phone_number] || @supplier.phone_number
  

    if @supplier.save
      render 'show.json.jb'
    else
      render json: {errors: @supplier.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    supplier = Supplier.find(params[:id])
    supplier.destroy
    render json: {message: "IT GONE"}
  end
end
