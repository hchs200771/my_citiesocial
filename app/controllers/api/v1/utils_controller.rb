class Api::V1::UtilsController < ApplicationController
  def subscribe
    email = params['subscribe']['email']
    sub = Subscribe.new(email: email)
    if sub.save
      render json: { status: 'ok', email: email }
    else
      render json: { status: 'duplicated', email: email }
    end
  end

  def cart

    product = Product.friendly.find(params[:id])
    sku = product.skus.find { |s| s.id == params[:sku].to_i }
    if sku
      current_cart.add_sku(sku.id, params[:quantity].to_i)
      session[:cart_9527] = current_cart.serialize
      render json: { status: 'ok', items: current_cart.items.count }
    else
      render json: { status: 'fail' }
    end
  end
end
