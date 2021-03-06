# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |n|
    User.create!(
      email: "test#{n + 1}@test.com",
      name: "test#{n + 1}@test.com",
      password: "test#{n + 1}@test.com"
    )
  end

array = ["アウトドア","スポーツ","旅行アイテム","ハウスアイテム","その他"]
array1 = ["洋服","グッズ","小物","その他"]
array2 = ["綺麗","普通","汚い","ボロボロ"]
array3 = ["東京","横浜","那覇","新潟","札幌","岩手","大阪","鹿児島","千葉","茨城","福岡"]
array4 = ["500","900","1200","2000","2300","200","3000","3200","1400","0","6000"]
array5 = ["1","2","3","4"]
array6 = ["./app/assets/images/sample1.jpg","./app/assets/images/sample2.jpg","./app/assets/images/sample3.jpg","./app/assets/images/sample4.jpg","./app/assets/images/sample5.jpg","./app/assets/images/sample6.jpg"]

200.times do |n|
    Item.create!(
      item_name: "テストアイテム#{n + 1}",
      main_category: array[rand(0..4)],
      sub_category: array1[rand(0..3)],
      status: array2[rand(0..3)],
      summary: "テストコメント#{n + 1}",
      address: array3[rand(0..10)],
      price: array4[rand(0..10)],
      user_id: array5[rand(0..3)],
      active: "true"
    )
  end

200.times do |n|
  Photo.create!(
    item_id: "#{n + 1}",
    image: open(array6.shuffle[rand(0..5)])
  )
end