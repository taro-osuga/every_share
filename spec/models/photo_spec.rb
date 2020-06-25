require 'rails_helper'

RSpec.describe Photo, type: :model,do: true  do
  let(:image_path) { Rails.root.join('spec/factories/sample1.jpg') }

  it "画像が投稿出来る" do
    photo = create(:photo)
    expect(photo).to be_valid
  end

end