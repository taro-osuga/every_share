class PhotosController < ApplicationController

    def create
      @item = Item.find(params[:item_id])
  
      if params[:images]
        params[:images].each do |img|
          @item.photos.create(image: img)
        end
  
        @photos = @item.photos
        redirect_back(fallback_location: request.referer, notice: "Saved...")
      end
    end
  
    def destroy
      @photo = Photo.find(params[:id])
      @items = @photo.item
  
      @photo.destroy
      @photos = Photo.where(item_id: @items.id)
  
      respond_to :js
    end
  end
  