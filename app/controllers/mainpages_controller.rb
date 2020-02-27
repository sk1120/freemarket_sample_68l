class MainpagesController < ApplicationController
  def index
    @category = Category.find(1)
    @items = Item.where(category_parent_id:@category.id).limit(3)
  end

  def show
    @items = Item.where(category_parent_id:@category.id)
  end

end
