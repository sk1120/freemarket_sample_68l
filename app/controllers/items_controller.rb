class ItemsController < ApplicationController
  # before_action :set_item,only: [:edit,:update,:destroy]
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
    @item = Item.new
    @categories = Category.all.where(ancestry: nil)
  end

  def create
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
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
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
    # binding.pry
    params.require(:item).permit(:name,:text , :category_parent_id , :category_child_id , :category_grand_child_id , :brand , :condition_id , :postage_id , :shipping_means_id , :prefecture_id , :shipping_date_id , :price, item_images_attributes: [:image_url,:_destroy,:id]).merge(saler_id: current_user.id)
    binding.pry
  end
end
