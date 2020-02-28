class MainpagesController < ApplicationController
  def index
    @category = Category.find(1)
    @items = Item.where(category_parent_id:@category.id).order("created_at DESC").limit(3)
    @itemsnew = Item.all.order("created_at DESC").limit(3)
  end

  def show
    @items = Item.where(category_parent_id:@category.id)
  end

  def logout

  end

  def new_credit_card

  end

  def index
    @categories = Category.all.where(ancestry: nil)
  end

  def ancestry_children
    parent = Category.find(params[:parent_id])
    @category_children = parent.children
  end

  def ancestry_grand_children
    child = Category.find(params[:child_id])
    @category_grand_children = child.children
    # binding.pry
  end

end


