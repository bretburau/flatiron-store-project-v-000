class StoreController < ApplicationController
  def index
    @categories = Category.all
    # binding.pry
    @items = Item.all.find_all {|i| i.inventory > 0}
  end
end
