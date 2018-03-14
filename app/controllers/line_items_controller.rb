class LineItemsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    if user_signed_in?
      if current_user.current_cart == nil
        @cart = current_user.carts.build
        current_user.current_cart = @cart
      else
        @cart = current_user.current_cart
      end
      @cart.add_item(@item.id)
      @cart.save
      current_user.save
      # binding.pry
      redirect_to cart_path(@cart)
    end
  end
end
