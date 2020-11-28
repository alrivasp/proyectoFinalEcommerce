class Product < ApplicationRecord
  belongs_to :category
  belongs_to :model_product
  has_many :variants
  has_many :reviews

  has_one_attached :front
  has_many_attached :galery

  validates :sku, uniqueness: true
end
