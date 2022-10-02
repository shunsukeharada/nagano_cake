class Item < ApplicationRecord
  belongs_to :gen
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
end
