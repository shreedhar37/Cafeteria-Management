#  customers_controller.rb
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
  end
end
