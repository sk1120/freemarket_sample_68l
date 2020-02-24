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
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      flash[:alert] = "入力が正しくありません"
      redirect_to root_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
  end

  private

  def convert_int(data)
    
  end

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :brand, :condition, :postage, :region, :shipping_date, :price,:shipping_means_id,:prefecture_id, item_images_attributes: [:image_url, :_destroy, :id]).merge(saler_id: current_user.id)
  end
end
