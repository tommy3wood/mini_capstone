class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:index, :create] #alt == except: [:show]

  def index
    @orders = current_user.orders
    render 'index.json.jb'
  end

  def create
    @order = Order.new(
                        user_id: current_user.id,
                        product_id: params[:product_id],
                        quantity: params[:quantity]
                        )
    @order.calculate_totals
    @order.save
    render 'show.json.jb'
  end

  def show
    @order = Order.find(params[:id])
    render 'show.json.jb'
  end

end
