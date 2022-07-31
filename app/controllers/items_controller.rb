class ItemsController < ApplicationController 
   def index 
      # @supermarket = Supermarket.find(params[:id])
      @items = Item.all
   end
end