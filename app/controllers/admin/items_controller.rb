class Admin::ItemsController < ApplicationController
    def new
        @item = Item.new
    end
    
    def index
        @items = Item.all
    end
    
    def show
        @item = Item.find(params[:id])
    end
    
    def create
        @item = Item.new(item_params)
        @item.save!
        redirect_to admin_item_path(@item)
    end
    
    def item_params
        params.require(:item).permit(:image, :name, :explanation, :genre_id, :tax_out_price, :is_sale)
    end
end
