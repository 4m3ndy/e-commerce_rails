class Product < ActiveRecord::Base
  has_many :order_lines
  validates :name, :presence =>true
  validates :description, :presence =>true
  validates :price, :presence =>true
  validates :status, :presence =>true
end
