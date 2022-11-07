require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "Basic functions" do
    let(:cart) { Cart.new }
    it "put product into cat" do
      cart.add_sku(2)
      expect(cart.empty?).to eq(false)
    end

    it "Adding same product will increase item quantity not increace item. " do
      3.times { cart.add_sku(1) }
      2.times { cart.add_sku(2) }
      expect(cart.items.size).to eq(2)
      expect(cart.items.first.quantity).to eq(3)
    end

    it "Product can put and pull from cart" do
      p1 = FactoryBot.create(:product, :with_skus)
      cart.add_sku(p1.skus.first.id)
      expect(cart.items.first.product).to be_a(Product)
    end

    it "Cart could count its total price" do
      p1 = FactoryBot.create(:product, :with_skus, sell_price: 5)
      p2 = FactoryBot.create(:product, :with_skus, sell_price: 10)
      3.times { cart.add_sku(p1.skus.first.id) }
      2.times { cart.add_sku(p2.skus.first.id) }
      expect(cart.total_price).to eq(35)
    end
  end

  describe "Advance functions" do
    let (:cart) { Cart.new }

    it "Cart content can convert to cart_hash, then store the hash into session" do
      p1 = FactoryBot.create(:product, sell_price: 5)
      p2 = FactoryBot.create(:product, sell_price: 10)
      3.times { cart.add_sku(p1.id) }
      2.times { cart.add_sku(p2.id) }
      expect(cart.serialize).to eq(cart_hash)
    end

    it "cart_hash can convert to Cart content" do
      cart = Cart.from_hash(cart_hash)
      expect(cart.items.first.quantity).to eq(3)
      expect(cart.items.first.sku_id).to eq(1)
    end
  end

  private

  def cart_hash
    {
      'items' => [
        { 'sku_id' => 1, 'quantity' => 3 },
        { 'sku_id' => 2, 'quantity' => 2 }
      ]
    }
  end
end
