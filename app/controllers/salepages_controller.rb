class SalepagesController < ApplicationController
  def index
    @item = Item.new
    @categories = Category.all.where(ancestry: nil)
    # binding.pry
  end

  def create
    redirect_to root_path
  end

  private
  def item_params
    params.require(:items).permit(item_images_attributes[:image_url],:name,:text,:category_id,:brand,:condition_id,:postage_id,:shipping_means_id,:prefecture_id,:shipping_date_id,:price)
  end
end
