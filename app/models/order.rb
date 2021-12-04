class Order < ApplicationRecord
  belongs_to :end_user
  has_many :order_details, dependent: :destroy
  
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: {
    waiting: 0,
    paid_up: 1,
    producing: 2,
    preparing: 3,
    shipped: 4
  }
end
