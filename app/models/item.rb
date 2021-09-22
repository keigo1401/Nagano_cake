class Item < ApplicationRecord

  belongs_to :genres
  has_many :cart_items
  has_many :order_details
  attachment :item_image

  validates :name, :image_id, :introduction, :price, presence: true
  validates :is_active, inclusion: {in: [TRUE, FALSE]}

end
