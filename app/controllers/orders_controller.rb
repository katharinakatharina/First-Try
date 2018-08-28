class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.admin?
      @orders = Order.includes(:product)
    else
      @orders = current_user.orders.includes(:product)
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy 
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

#  private
#    # Use callbacks to share common setup or constraints between actions.
#    def set_order
#      @order = Order.find(params[:id])
#    end

    # Never trust parameters from the scary internet, only allow the white list through.
#    def order_params
#      params.require(:product).permit(:name, :description, :image_url, :price, :color, :brand, :brand_image, :article_number)
#    end

end
