class Api::CartedProductsController < ApplicationController

  def index
    if current_user
      @carted_products = CartedProduct.all
      @carted_products = @carted_products.where("status = ?", "carted")
      render 'index.json.jb'
    else
      render json: {message: "You're not supposed to be here"}
    end
  end

  def create
    @carted_product = CartedProduct.new(
                                        product_id: params[:product_id],
                                        quantity: params[:quantity],
                                        user_id: current_user.id,
                                        status: "carted"
                                        )
    if @carted_product.save
      render 'show.json.jb'
    else
      render json: {errors: @carted_product.errors.full_messages}, status: :unprocessable_entity
    end
  end

end
