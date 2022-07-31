class ItemsController < ApplicationController 
   def index 
      @supermarket = Supermarket.find(params[:id])
      @items = @supermarket.unique_items
   end
end