class GuestReviewsController < ApplicationController

    def create    
        @reservation = Reservation.guest_reviews_search(guest_review_params[:reservation_id],guest_review_params[:item_id])
  
      if !@reservation.nil? && @reservation.item.user.id == guest_review_params[:host_id].to_i
  
        @has_reviewed = GuestReview.guest_has_reviewed(@reservation.id,guest_review_params[:host_id].to_i)
        
        if @has_reviewed.blank?
            @guest_review = current_user.guest_reviews.create(guest_review_params)
            flash[:success] = "レビューを送信しました"
        else
            flash[:success] = "既にレビューがあります"
        end
      else
        flash[:alert] = "予約が見つかりません"
      end
  
      redirect_back(fallback_location: request.referer)
    end
  
    def destroy
      @guest_review = Review.find(params[:id])
      @guest_review.destroy
  
      redirect_back(fallback_location: request.referer, notice: "削除しました!")
    end
  
    private
      def guest_review_params
        params.require(:guest_review).permit(:comment, :star, :item_id, :reservation_id, :host_id)
      end
  end
  