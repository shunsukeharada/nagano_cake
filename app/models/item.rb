class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  
  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :genre_id, presence: true
  validates :tax_out_price, presence: true
  

  attachment :image
  
  def with_tax_price
    (tax_out_price * 1.1).floor
  end
  
  def self.search(keyword)
      where(["name like?", "%#{keyword}%"])
  end
end
