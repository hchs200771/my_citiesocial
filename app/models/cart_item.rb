class CartItem
  attr_reader :sku_id, :quantity

  def initialize(sku_id, quantity = 1)
    @sku_id = sku_id
    @quantity = quantity
  end

  def increment!(amount = 1)
    @quantity += amount
  end

  def decrement!(amount = 1)
    @quantity -= amount
  end

  def product
    Product.joins(:skus).find_by(skus: { id: sku_id })
  end

  def total_price
    product.sell_price * quantity
  end

end
