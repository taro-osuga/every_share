require 'rails_helper'
RSpec.describe Reservation, type: :model do

    it "予約が登録できる" do 
        expect(FactoryBot.create(:reservation)).to be_valid
      end
  
  end