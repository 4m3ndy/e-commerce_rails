class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :order_lines

  before_save :update_total

  def total
    order_lines.collect { |ol| ol.valid? ? (ol.qty * ol.unit_price) : 0 }.sum
  end

  private

  def update_total

    self[:total] = total

  end
end
