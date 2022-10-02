class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum production_status: {
    restricting: 0,
    waiting: 1,
    producing: 2,
    preparing: 3,
  }
  
  def subtotal
    price * quantity
  end
end
