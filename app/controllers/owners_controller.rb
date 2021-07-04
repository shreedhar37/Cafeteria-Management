class OwnersController < ApplicationController
  def new
    @owner = Owner.new
  end
end
