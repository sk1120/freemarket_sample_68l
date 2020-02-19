class ItemImagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end

  def create
    @image = ItemImage.new(image_url: params[:file])
    if @image.save
      render json: { message: "success", fileID: @image.id }, :status => 200
    else
      render json: { error: @image.errors.full_messages.join(',')}, :status => 400
    end
  end

  def destroy
    @image = ItemImage.find(params[:id])
    if @image.destroy 
        render json:{ message: "file deleted from server"}
    else
        render json:{ message: @image.errors.full_messages.join(", ") }
    end
  end
end
