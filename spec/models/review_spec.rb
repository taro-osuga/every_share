require 'rails_helper'
RSpec.describe Review, type: :model do

    it "レビューが登録できる" do 
        expect(FactoryBot.create(:review)).to be_valid
    end
end