class Item < ApplicationRecord

  # enum is_active: {"販売中": TRUE, "販売停止中": FALSE }

  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  attachment :image

  validates :name, :image, :introduction, :price, presence: true
  validates :is_active, inclusion: {in: [TRUE, FALSE]}

end
