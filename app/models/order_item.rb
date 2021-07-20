class OrderItem < ApplicationRecord
  belongs_to :order

  def select_user(order_id)
    Order.find(order_id).user_id
  end

  def find_user(user_id)
    User.select(:first_name, :last_name).find(user_id)
  end
end
