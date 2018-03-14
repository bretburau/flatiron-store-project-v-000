class StoreController < ApplicationController
  def index
    @categories = Category.all
    # binding.pry
    # @current_cart = current_user.current_cart
    @items = Item.all.find_all {|i| i.inventory > 0}
  end
end
