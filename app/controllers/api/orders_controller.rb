class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:index, :create] #alt == except: [:show]

  def index
    @orders = current_user.orders
    render 'index.json.jb'
  end

  def create
    @order = Order.new(
                        user_id: current_user.id
                        )
    if @order.save
      render 'show.json.jb'
     else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find(params[:id])
    render 'show.json.jb'
  end

end
