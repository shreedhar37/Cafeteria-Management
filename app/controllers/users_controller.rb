#  customers_controller.rb
class UsersController < ApplicationController
  def index
    render plain: "Hello, this is /users!"
  end
end
