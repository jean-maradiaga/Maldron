class Category < ApplicationRecord
  has_many :posts
  has_many :line_items, inverse_of: :order
end
