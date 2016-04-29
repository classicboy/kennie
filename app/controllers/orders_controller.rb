class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.page(params[:page]).per(10)
  end
end