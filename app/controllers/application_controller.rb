class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :find_categories, unless: :backend?
  helper_method :current_cart

  private

  def record_not_found
    render file: Rails.root.join('public', '404.html'),
           status: :not_found,
           layout: false
  end

  def backend?
    controller_path.split('/').first == 'admin'
  end

  def find_categories
    @categories = Category.all
  end

  def current_cart
    @current_cart ||= Cart.from_hash(session[:cart_9527])
  end
end
