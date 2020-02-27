class ItemsController < ApplicationController

  require 'payjp'

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
      redirect_to item_path(@item)
    else
      flash[:alert] = "入力が正しくありません"
      render :new
    end
  end

  def edit
    @categories = Category.where(ancestry: nil)
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def purchase
    @item = Item.find(params[:item_id])
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.find_by(user_id: current_user.id)
    item = Item.find(params[:item_id])
    item.update(buyer_id: current_user.id)
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
    :amount => item.price, 
    :customer => card.customer_id, 
    :currency => 'jpy', 
    )
    redirect_to action: 'done' 
  end

  def done
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
