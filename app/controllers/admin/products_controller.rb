class Admin::ProductsController < Admin::BaseController
  before_action :find_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.includes(:vendor)
  end

  def new
    @product = Product.new
    @product.skus.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to admin_products_path, notice: 'Product successfully created'
    else
      flash[:error] = @product.errors.full_messages
      render 'new'
    end
  end

  def edit

  end

  def update
    if @product.update(product_params)
      redirect_to edit_admin_product_path(@product), notice: "Product 「#{@product.name}」 successfully updated"
    else
      flash[:error] = @product.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    if @product.destroy
      redirect_to admin_products_path, notice: 'Product successfully deleted'
    else
      flash[:error] = @product.errors.full_messages
      redirect_to admin_products_path, notice: 'Product deleted failed'
    end
  end

  private

  def find_product
    @product = Product.friendly.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name,
                                    :vendor_id,
                                    :list_price,
                                    :sell_price,
                                    :on_sell,
                                    :description,
                                    skus_attributes: [
                                      :id,
                                      :spec,
                                      :quantity,
                                      :_destroy
                                    ])
  end

end
