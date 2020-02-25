class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit,:update,:destroy]
  before_action :authenticate_user!

  def show
    @items = Item.includes(:item_images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @categories = Category.all.where(ancestry: nil)
  end

  def create
    @item = Item.new(item_params)
    @categories = Category.all.where(ancestry: nil)
    if @item.save
      redirect_to root_path
    else
      flash[:alert] = "入力が正しくありません"
      render :new
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

  def purchase
    @item = Item.find(params[:item_id])
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

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :text,:category_parent_id,:category_child_id ,:category_grand_child_id, :brand, :condition, :postage, :region, :shipping_date, :price,:shipping_means_id,:prefecture_id, item_images_attributes: [:image_url, :_destroy, :id]).merge(saler_id: current_user.id)
  end
end
