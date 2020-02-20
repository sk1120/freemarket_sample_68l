class ItemsController < ApplicationController

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.item_images.new
    @parents = Category.all.order("id ASC").limit(13)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :saler_id, :buyer_id, :brand_id, :category_id, :condition, :potage, :shipping_means, :region, :shipping_date, :price, images_attributes: [:src])
  end
end
