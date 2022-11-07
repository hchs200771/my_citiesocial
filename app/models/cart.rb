class Cart
  attr_reader :items
  def initialize
    @items = []
  end

  def self.from_hash(hash = nil)
    cart = Cart.new
    if hash && hash["items"]
      hash["items"].each do |hash_item|
        cart.add_sku(hash_item['sku_id'], hash_item['quantity'].to_i)
      end
    end
    cart
  end

  def add_sku(sku_id, amount = 1)
    item = @items.find { |i| i.sku_id == sku_id }
    if item
      item.increment!(amount)
    else
      @items << CartItem.new(sku_id, amount)
    end
  end

  def serialize
    items_hash = items.map do |item|
      { "sku_id" => item.sku_id, "quantity" => item.quantity }
    end
    { 'items' => items_hash }
  end

  def remove_sku(sku_id, amount = 1)
    item = @items.find { |i| i.sku_id == sku_id }
    item.decrement!(amount)
  end

  def empty?
    @items.empty?
  end

  def total_price
    items.sum(&:total_price)
  end

end
