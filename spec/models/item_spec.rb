require 'rails_helper'
RSpec.describe Item, type: :model do

    it "名前、メインカテゴリー、サブカテゴリー、ステイタスがあれば登録できる" do 
        expect(FactoryBot.create(:item)).to be_valid
      end
        
    it "メインカテゴリーがなければ登録できない" do 
        expect(FactoryBot.build(:item, main_category: "")).to_not be_valid 
      end
  
    it "サブカテゴリーがなければ登録できない" do 
        expect(FactoryBot.build(:item, sub_category: "")).to_not be_valid 
      end
    
    it "ステイタスがなければ登録できない" do 
      expect(FactoryBot.build(:item, status: "")).to_not be_valid 
    end
  
  end