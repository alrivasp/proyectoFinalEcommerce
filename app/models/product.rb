class Product < ApplicationRecord
  belongs_to :category
  belongs_to :model_product
end