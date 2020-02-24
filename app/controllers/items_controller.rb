class ItemsController < ApplicationController

  def index
    @items = Item.includes(:images).order('created_at DESC')
    @item = Item.new
  end

  def new
    @item = Item.new
    @item.item_images.build
    @parents = Category.all.order("id ASC").limit(13)
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    binding.pry
    if @item.save
      redirect_to root_path
    else
      flash[:alert] = "入力が正しくありません"
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def convert_int(data)
    
  end

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :brand, :condition, :postage, :region, :shipping_date, :price,:shipping_means_id,:prefecture_id, item_images_attributes: :image_url).merge(saler_id: current_user.id)
  end
end
