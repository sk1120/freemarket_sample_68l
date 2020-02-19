class ItemsController < ApplicationController
  def index
    @items = Item.new
  end

  def new
    @parents = Category.all.order("id ASC").limit(13)
    @item = Item.new
  end

  def create

  end

  def search
    respond_to do |format|
      format.html
      format.json do
       @children = Category.find(params[:parent_id]).children
       #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
      end
    end
  end
end
