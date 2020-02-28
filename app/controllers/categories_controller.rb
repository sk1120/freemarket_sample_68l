class CategoriesController < ApplicationController

  def index
    @categories = Category.all.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.where(category_parent_id:@category.id)
  end
end
