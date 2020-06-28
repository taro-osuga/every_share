class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
      @items = @user.items
  
       @guest_reviews = Review.where(type: "GuestReview", host_id: @user.id)
       @host_reviews = Review.where(type: "HostReview", guest_id: @user.id)
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to("/")
    end
end