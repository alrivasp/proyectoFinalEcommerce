class Order < ApplicationRecord
  ORDER_PREFIX = 'OC'
  RANDOM_SIZE = 9

  belongs_to :user
  belongs_to :order_type
  has_many :order_histories
  has_many :order_items
  has_many :payments

  validates :number, uniqueness: true
  before_create -> { generate_number(RANDOM_SIZE) }

  def generate_number(size)
    self.number = loop do
      rand_str = random_candidate(size)
      break rand_str unless Order.exists?(number: rand_str)
    end
  end

  def random_candidate(size)
    "#{ORDER_PREFIX}#{(Array.new(size){rand(size)}.split.join(""))}"
  end

  def add_variant(variant_id, quantity)
    variant = Variant.find(variant_id)
    if variant
      order_items.create( variant_id: variant.id,
                          quantity: quantity,
                          price: variant.product.price
                        )
    end
  end

  def add_history
    order_status = OrderStatus.find(1)
    order_histories.create( description: order_status.description,
                            order_id: self.id,
                            order_status_id: order_status.id
                          )
  end
  
  
  def compute_total
    sum = 0
    order_items.each do |item|
      sum += item.price
    end
    update_attribute(:total, sum)
  end
  
end
