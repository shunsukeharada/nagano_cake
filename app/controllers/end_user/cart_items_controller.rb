class EndUser::CartItemsController < ApplicationController
    before_action :authenticate_end_user!
    
    def index
        @cart_items = current_end_user.cart_items.all
        @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
    end
    
    def create
        @cart_item = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
        if @cart_item
            @cart_item.amount += params[:cart_item][:amount].to_i
        else
           @cart_item = CartItem.new(cart_item_params)
        end
        @cart_item.save
        redirect_to cart_items_path
    end
    
    def update
        cart_item = CartItem.find(params[:id])
        cart_item.update(cart_item_params)
        redirect_to cart_items_path
    end
    
    def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to cart_items_path
    end
    
    def destroy_all
        CartItem.destroy_all
        redirect_to cart_items_path
    end
    
    private
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :amount, :end_user_id)
    end
    
    
end
