class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all.where(ancestry: nil)
  end

  def show
    # @items = Category.find(params[:id])
  end


  private

  # def category_params
  #   params.require(:category).permit(:content, :image).merge(category_id: current_category.id)
  # end

end
