class MainpagesController < ApplicationController
  def index
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


