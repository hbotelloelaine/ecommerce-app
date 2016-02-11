class SuppliersController < ApplicationController

  def index
    @supplier = Supplier.all
  end
  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to "/supplier/#{supplier.id}"
    else
      render :new

    end
  end

    def show
      @supplier = Supplier.find(params[:id])

    end

    def edit
      @supplier = Supplier.find(parms[:supplier])

    end

    def update
      @supplier = Supplier.find(params[:id])
      @supplier.update(supplier_params)
      redirect_to "/suppliers/#{supplier.id}"
    else
      render :edit
    end
  end

    def destroy
      @supplier = Supplier.find(params[:id]).update(active: false)
      redirect_to "/suppliers"
    # Supplier.find(params[:id]).update(active: false)
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :email, :phone)
  end
end

