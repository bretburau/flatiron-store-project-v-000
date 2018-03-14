class CategoriesController < ApplicationController
  def show
    ###
    @category = Category.find(params[:id])
    # binding.pry
  end

  def index
    @categories = Category.all
  end
end
