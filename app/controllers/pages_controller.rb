class PagesController < ApplicationController
  def home
    @items = Item.where(active: true).limit(100)
  end

  def search
    # @q = Item.ransack(params[:q])
    # @items = @q.result(distinct: true)

    # STEP 1
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end

    # STEP 2
    if session[:loc_search] && session[:loc_search] != ""
      @items_address = Item.where(active: true).near(session[:loc_search], 5, order: 'distance')
    else
      @items_address = Item.where(active: true).all
    end

    # STEP 3
    @search = @items_address.ransack(params[:q])
    @items = @search.result

    @arritems = @items.to_a

    # STEP 4
    if (params[:start_date] && params[:end_date] && !params[:start_date].empty? &&  !params[:end_date].empty?)

      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      @items.each do |item|

        not_available = item.reservations.where(
          "(? <= start_date AND start_date <= ?)
          OR (? <= end_date AND end_date <= ?)
          OR (start_date < ? AND ? < end_date)",
          start_date, end_date,
          start_date, end_date,
          start_date, end_date
        ).limit(1)

        if not_available.length > 0
          @arritems.delete(item)
        end
      end
    end

  end
end
