#  customers_controller.rb
class CustomersController < ApplicationController
  def index
    render plain: "Hello, this is /customers!"
  end
end
