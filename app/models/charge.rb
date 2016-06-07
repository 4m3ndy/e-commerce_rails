class Charge < ActiveRecord::Base
  belongs_to :order

  validates :order_id, :presence =>true
  validates :email, :presence => true
  validates :cart_token, :presence => true

  after_create :process_payment


  def process_payment

    customer = Stripe::Customer.create email: email,
                                       card: card_token


    Stripe::Charge.create customer: customer.id,
                          amount: (self.order.total*100).round ,
                          description: self.order.order_no,
                          currency: 'usd'

  end
end