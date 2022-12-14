class Admin::ItemsController < ApplicationController
    before_action :authenticate_admin!

    def new
        @item = Item.new
    end
    
    def index
        if @keyword = params[:keyword]
            @items = Item.search(@keyword)
        else
            @items = Item.all
        end
    end
    
    def show
        @item = Item.find(params[:id])
    end
    
    def create
        @item = Item.new(item_params)
        @item.save
        redirect_to admin_item_path(@item)
    end
    
    def item_params
        params.require(:item).permit(:image, :name, :explanation, :genre_id, :tax_out_price, :is_sale)
    end
end
