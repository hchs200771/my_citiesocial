class Admin::VendorsController < Admin::BaseController
  before_action :find_vendor, only: %i[edit update destroy]
  def index
    @vendors = Vendor.all
  end

  def edit
  end

  def update
    if @vendor.update(vendor_params)
      redirect_to edit_admin_vendor_path(@vendor), notice: "Vendor 「#{@vendor.title}」 successfully updated"
    else
      flash[:error] = @vendor.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    if @vendor.destroy
      redirect_to admin_vendors_path, notice: 'Vendor successfully deleted'
    else
      flash[:error] = @vendor.errors.full_messages
      redirect_to admin_vendors_path, notice: 'Vendor deleted failed'
    end
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      redirect_to admin_vendors_path, notice: 'Vendor successfully created'
    else
      flash[:error] = @vendor.errors.full_messages
      render 'new'
    end
  end

  private

  def find_vendor
    @vendor = Vendor.find(params[:id])
  end

  def vendor_params
    params.require(:vendor).permit(:title, :description, :online)
  end

end
