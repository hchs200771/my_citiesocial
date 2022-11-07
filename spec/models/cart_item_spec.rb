require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe "Basic functions" do
    let(:cart) { Cart.new }
    it "Each cart_item could count its own total price" do
      p1 = FactoryBot.create(:product, :with_skus, sell_price: 5)
      p2 = FactoryBot.create(:product, :with_skus, sell_price: 10)
      3.times { cart.add_sku(p1.skus.first.id) }
      2.times { cart.add_sku(p2.skus.first.id) }
      expect(cart.items.first.total_price).to eq(15)
    end
  end
end
