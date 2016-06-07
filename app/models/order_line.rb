class OrderLine < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :qty, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  before_save :check

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * qty
  end

  private
  def product_present
    if product.nil? || product.status == 0
      errors.add(:product, "is not valid or is disabled.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def check
    self[:unit_price] = unit_price
    self[:total_price] = qty * self[:unit_price]
  end
end
