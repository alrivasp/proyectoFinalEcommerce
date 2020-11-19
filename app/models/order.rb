class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_type
  has_many :order_histories
  has_many :order_items
end
