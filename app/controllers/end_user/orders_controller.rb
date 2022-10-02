class EndUser::OrdersController < ApplicationController
    before_action :check_cart_items, only: [:new, :create]
    
    def new
        @order = Order.new
    end
    
    def confirm
        @order = current_end_user.orders.new(order_params)
        if  params[:order][:select_address] == "0"
            @order.name = current_end_user.first_name + current_end_user.last_name
            @order.postal_code = current_end_user.postal_code
            @order.address = current_end_user.address
        elsif params[:order][:select_address] == "1"
                selected_address = Address.find(params[:order][:address_id])
                @order.postal_code = selected_address.postal_code
                @order.name = selected_address.name
                @order.address = selected_address.address
        elsif params[:order][:select_address] == "2"
            address_new = current_end_user.addresses.new(address_params)
            if address_new.save
               @order.name = address_new.name
               @order.postal_code = address_new.postal_code
               @order.address = address_new.address 
            end
        end
        @cart_items = current_end_user.cart_items.all
        @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
    end
    
    def create
        @cart_items = current_end_user.cart_items.all
        @order = current_end_user.orders.new(order_params)
        @cart_items.each do |cart_item|
            @order_detail = @order.order_details.new
            @order_detail.item_id = cart_item.item_id
            @order_detail.quantity = cart_item.amount
            @order_detail.price = cart_item.item.with_tax_price
            @order_detail.save
        end
        @cart_items.destroy_all
        @order.save
        redirect_to orders_complete_path
    end
    
    private
    
    def order_params
        params.require(:order).permit(:name, :postal_code, :address, :payment_method)
    end
    
    def address_params
        params.require(:order).permit(:name, :postal_code, :address)
    end
    
    def check_cart_items
        if current_end_user.cart_items.blank?
          redirect_to root_path
        end
    end

end
