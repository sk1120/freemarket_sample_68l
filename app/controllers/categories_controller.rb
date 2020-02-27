class CategoriesController < ApplicationController
  def show
    @items = Category.find(params[:id])
  end

  def index
    @categories = Category.all.where(ancestry: nil)
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

  
  # private

  # def set_category
  #   @parents = Category.roots
  # end
end
