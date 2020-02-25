class ItemsController < ApplicationController
  before_action :set_item, only: [:edit,:update,:destroy]

  def show
    @items = Item.includes(:item_images).order('created_at DESC')
    @item = Item.new
    @item = Item.find(params[:id])
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
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :brand, :condition, :postage, :region, :shipping_date, :price,:shipping_means_id,:prefecture_id, item_images_attributes: [:image_url, :_destroy, :id]).merge(saler_id: current_user.id)
  end
end
