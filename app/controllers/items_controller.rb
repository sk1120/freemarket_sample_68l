class ItemsController < ApplicationController

  # def index
  #   @category = Category.all.order("id ASC").limit(13)
  # end

  def new
    @item = Item.new
    # @parents = Category.all.order("id ASC").limit(13)
    # @item.build_shipment
    # @item.build_brand
  end

   def create
    　@item = Item.new(item_params)
    # 　if @item.save!
    #    shipment_id = Shipment.find(@item.id).id #Shipmentテーブルのidを取り出す
    #    item = Item.find(@item.id)               #作成したItemのidを取り出す
    #   #  item.update(shipment_id: shipment_id)　　#Itemテーブルにshipment_idのカラムを入れる
    #    redirect_to root_path
    # 　else
    #    redirect_to new_item_path
    # 　end
    end
    
    # def item_params
    #   params.require(:item).permit(:name, :text, :condition, :postage, :rigon, :shipping_date :price,
    # 　item_images_attributes: [:id, :image_url, :).merge(seller_id: current_user.id)
    # end
end
