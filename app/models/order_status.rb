class OrderStatus < ApplicationRecord
    has_many :order_histories
end
