FactoryBot.define do
    factory :photo do
      image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/sample1.jpg')) }
      association :item  #アソシエーションを定義
    end
  end