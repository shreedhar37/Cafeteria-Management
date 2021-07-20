class Owner < ApplicationRecord
  has_secure_password
  has_many :order_items
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, presence: true
end
