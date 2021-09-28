class Order < ApplicationRecord

  belongs_to :customers
  has_many :order_details

  enum payment_method:{credit_card: 0, transfer: 1}
  enum status:{waiting: 0, checked: 1, making: 2, preparation: 3, sent: 4}

end
