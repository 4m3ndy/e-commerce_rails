class ChargesController < ApplicationController


  before_action :authenticate_customer!

  def create
    @charge = Charge.new charge_params.merge(email: stripe_params["stripeEmail"],
                                                         card_token: stripe_params["stripeToken"],
                                                         full_name: current_customer.first_name + " " + current_customer.last_name)

    raise "Please, check charge errors" unless @charge.valid?
    @charge.save

    order = Order.find_by_id(charge_params[:order_id])
    order.update({status:  1})

    redirect_to orders_path, notice: 'Your Ordered is Paid Successfully'
  end

  def new

    @charge = Charge.new
    @order = Order.find_by_id(params["o_id"])

  end

  private

  def stripe_params
    params.permit :stripeEmail, :stripeToken
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def charge_params
    params.require(:charge).permit(:order_id, :full_name, :company, :telephone)
  end


end
