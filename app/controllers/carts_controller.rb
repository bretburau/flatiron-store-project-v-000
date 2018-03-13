class CartsController < ApplicationController
  before_action :get_cart
  def show
  end

  def checkout
    # binding.pry
    @current_cart.items.each do |item|
      item.inventory -= LineItem.find_by(item_id: item.id).quantity # subtract appropriate qty
      item.save
    end
    @current_cart.status = "submitted"
    @current_cart.save
    redirect_to cart_path(@current_cart)
  end

  private

  def get_cart
    @current_cart = Cart.find(params[:id])
  end
end
