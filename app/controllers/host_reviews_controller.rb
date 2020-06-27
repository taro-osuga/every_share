class HostReviewsController < ApplicationController

    def create  
       @reservation = Reservation.host_reviews_search(host_review_params[:reservation_id],host_review_params[:item_id],host_review_params[:guest_id])

      if !@reservation.nil?
  
        @has_reviewed = HostReview.host_has_reviewed(@reservation.id,host_review_params[:guest_id].to_i)

  
        if @has_reviewed.blank?
            @host_review = current_user.host_reviews.create(host_review_params)
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
      @host_review = Review.find(params[:id])
      @host_review.destroy
  
      redirect_back(fallback_location: request.referer, notice: "削除しました!")
    end
  
    private
      def host_review_params
        params.require(:host_review).permit(:comment, :star, :item_id, :reservation_id, :guest_id)
      end
  end
  