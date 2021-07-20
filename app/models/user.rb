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
  validates :email, :password, presence: true

  # def find_user(params[:id])
  #   # @user = User.find(params[:id]).first_name
  # end
end
