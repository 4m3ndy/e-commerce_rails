class OrdersController < ApplicationController

  before_action :authenticate_customer!
  before_action :set_order, only: [:show]

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_customer.try(:orders).order(date: :desc)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  def create_order
    if !session[:order_id].nil?

      @order = Order.find_by_id(session[:order_id])
      @order.customer_id = current_customer.id
      @order.date = DateTime.now.to_date
      @order.order_no = random_string
      @order.status = 0

      session[:order_id] = nil

      respond_to do |format|
        if @order.save
          format.html { redirect_to @order, notice: 'Order was successfully created.' }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end

    else

      respond_to do |format|
      format.html { redirect_to root_path, notice: "There's no items in your Shopping Cart, Please add, Then Try again." }
      end

    end

  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit()
    end

  def random_string(length=8)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789'
    order_num = ''
    length.times { order_num << chars[rand(chars.size)] }
    order_num
  end
end
