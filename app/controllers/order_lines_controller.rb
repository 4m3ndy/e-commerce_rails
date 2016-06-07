class OrderLinesController < ApplicationController

  before_action :authenticate_customer!

  def create
    @order = current_order
    @order_line = @order.order_lines.new(order_lines_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_line = @order.order_lines.find(params[:id])
    @order_line.update_attributes(order_lines_params)
    @order_lines = @order.order_lines
  end

  def destroy
    @order = current_order
    @order_line = @order.order_lines.find(params[:id])
    @order_line.destroy
    @order_lines = @order.order_lines
  end

  private
  def order_lines_params
    params.require(:order_line).permit(:qty, :product_id)
  end

end
