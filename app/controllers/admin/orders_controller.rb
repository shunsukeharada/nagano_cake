class Admin::OrdersController < ApplicationController
    def index
        @orders = Order.all
    end
    
    def show
        @order = Order.find(params[:id])
        @order_details = @order.order_details
    end
    
    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
        @order_details = @order.order_details
        
        if @order.order_status == "paid_up"
            @order_details.each do |order_detail|
                order_detail.production_status = "waiting"
                order_detail.save
            end
        end
        redirect_to admin_order_path(@order)
    end
    
    private
    def order_params
        params.require(:order).permit(:order_status)
    end
end
