class Admin::OrderDetailsController < ApplicationController
    def update
        @order_detail = OrderDetail.find(params[:id])
        @order = @order_detail.order
        @order_details = @order.order_details
        @order_detail.update(order_detail_params)
        
        if @order_details.where(production_status: "producing").count >= 1
            @order.order_status = "producing"
            @order.save
        end
        
        if @order.order_details.count == @order_details.where(production_status: "preparing").count
            @order.order_status = "preparing"
            @order.save
        end
        redirect_to admin_order_path(@order_detail.order)
    end
    
    private
    def order_detail_params
        params.require(:order_detail).permit(:production_status)
    end
end
