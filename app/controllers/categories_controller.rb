class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.find_by(category_child_id:@category.id)
  end
end
