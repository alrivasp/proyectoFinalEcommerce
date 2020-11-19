class Variant < ApplicationRecord
  belongs_to :product
  belongs_to :size_product
  has_many :order_items
end
