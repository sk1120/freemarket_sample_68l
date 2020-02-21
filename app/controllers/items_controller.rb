class ItemsController < ApplicationController

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.item_images.new

    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
    end

  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
  #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
  @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
  @category_grandchildren = Category.find("#{params[:child_id]}").children
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
