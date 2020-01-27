class Api::ProductsController < ApplicationController

  def index
    search_term = params[:search]
    discount_search = params[:discount]
    sort_action = params[:sort]
    sort_order = params[:sort_order]
    @products = Product.all

    if search_term
      @products = @products.where("name iLIKE ?", "%#{search_term}%")
    end

    if discount_search == "true"
      @products = @products.where("price < ?", 100)
    end

    if sort_order && sort_action
      @products = @products.order(sort_action => sort_order)
    elsif sort_action
      @products = @products.order(sort_action)
    else
      @products = @products.order(id: :asc)
    end

    render 'index.json.jb'
  end

  def create
    @product = Product.new(
                name: params[:name],
                price: params[:price],
                description: params[:description]
                )
    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @product = Product.find(params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    # @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description

    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: {message: "IT GONE"}
  end

end
