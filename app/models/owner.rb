class Owner < ApplicationRecord
  has_secure_password
  has_many :order_items
  validates :email, :password, presence: true
end
