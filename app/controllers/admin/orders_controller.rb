class Admin::OrdersController < Admin::BasesController
  def index
    @orders = Order.all
  end
end
