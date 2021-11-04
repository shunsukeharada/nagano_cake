class CartItem < ApplicationRecord
  belongs_to :end_users
  belongs_to :items
end
