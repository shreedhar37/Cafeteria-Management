# email : string
# password_digest: string
#
# password: string virtual
# password_confirmation: string virtual

class User < ApplicationRecord
  has_secure_password
  has_many :order
  has_many :cart
  validates :email, :password, presence: true
end
