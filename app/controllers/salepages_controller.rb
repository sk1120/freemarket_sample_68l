class SalepagesController < ApplicationController
  def index
    @item = Item.new
    @categories = Category.all.where(ancestry: nil)
    # binding.pry
  end

  def ancestry_children
    parent = Category.find(params[:category_id])
    @category_children = parent.children
  end

  def ancestry_grand_children
    child = Category.find(params[:child_id])
    @category_grand_children = child.children
  end

  private
  def item_params
    params.require(:items).permit(item_images_attributes[:image_url],:name,:text,:category_id,:brand,:condition_id,:postage_id,:shipping_means_id,:prefecture_id,:shipping_date_id,:price)
  end
end
