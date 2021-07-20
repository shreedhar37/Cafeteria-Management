# email : string
# password_digest: string
#
# password: string virtual
# password_confirmation: string virtual

class User < ApplicationRecord
  has_secure_password
  has_many :order
  has_many :order_items
  has_many :cart
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, presence: true
end
