class MainpagesController < ApplicationController
  def index
    @category = Category.find(1)
    @items = Item.where(category_parent_id:@category.id).order("created_at DESC").limit(3)
    @itemsnew = Item.all.order("created_at DESC").limit(3)

  end

  def show
    @items = Item.where(category_parent_id:@category.id)
  end

end
