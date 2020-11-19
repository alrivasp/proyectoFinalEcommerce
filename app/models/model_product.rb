class ModelProduct < ApplicationRecord
  has_many :products
  belongs_to :mark
end
