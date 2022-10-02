class EndUser::ItemsController < ApplicationController
    def index
        @items = Item.all
    end
end
