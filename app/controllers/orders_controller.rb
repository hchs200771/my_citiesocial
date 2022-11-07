class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = current_user.orders.create(order_params)

    current_cart.items.each do |item|
      @order.order_items.build(sku_id: item.sku_id, quantity: item.quantity)
    end

    if @order.save
      redirect_to root_path, notice: 'Order was successfully created'
    else
      render 'carts/checkout'
    end
  end

  private

  def order_params
    params.require(:order).permit(:recipient, :tel, :address, :note)
  end

end
