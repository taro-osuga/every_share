class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorised, only: [:listing, :pricing, :description, :photo_upload, :location, :update]

  def index
    @items = current_user.items
  end

  def new
    @item = current_user.items.new
  end

  def create
    @item = current_user.items.new(item_params)
    
    if @item.save
      redirect_to listing_item_path(@item), notice: "Saved..."
    else
      flash[:alert] = "Something went wrong..."
      render :new
    end
  end

  def show
    @photos = @items.photos
    @guest_reviews = @items.guest_reviews
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
    @photos = @items.photos
  end

  def location
  end

  def update
    new_params = item_params
    new_params = item_params.merge(active: true) if is_ready_item

    if @items.update(new_params)
      flash[:notice] = "保存しました"
    else
      flash[:alert] = "入力不足があります"
    end
    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @items.destroy
    redirect_to items_path, notice:"destroy！"
  end

  # --- Reservations ---
  def preload
    today = Date.today
    reservations = @items.reservations.where("start_date >= ? OR end_date >= ?", today, today)

    render json: reservations
  end

  def preview
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    output = {
      conflict: is_conflict(start_date, end_date, @items)
    }

    render json: output
  end

  private
    def is_conflict(start_date, end_date, items)
      check = items.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
      check.size > 0? true : false
    end

    def set_item
      @items = Item.find(params[:id])
    end

    def is_authorised
      redirect_to root_path, alert: "You don't have permission" unless current_user.id == @items.user_id
    end

    def is_ready_item
      !@items.active && !@items.price.blank? && !@items.item_name.blank? && !@items.photos.blank? && !@items.address.blank?
    end

    def item_params
      params.require(:item).permit(:main_category, :sub_category, :status, :item_name, :summary, :price, :address, :active)
    end
end
