class Product < ApplicationRecord
  belongs_to :category
  belongs_to :model_product
  has_many :variants

  has_one_attached :front
  has_many_attached :galery
end
