class CartsController < ApplicationController
  before_action :authenticate_customer!

  def show
    @order_lines = current_order.order_lines
  end
end
