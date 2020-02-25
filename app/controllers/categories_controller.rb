class CategoriesController < ApplicationController
  def show
    @items = Category.find(params[:id])
  end

  def index
    @categories = Category.all.where(ancestry: nil)
  end


  
  # private

  # def set_category
  #   @parents = Category.roots
  # end
end
