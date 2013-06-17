#coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
user_ids = [ 
  FactoryGirl.create( :user, name: 'アイセル 太郎', email: 'test_user1@test.com', password_digest: 'password'),
  FactoryGirl.create( :user, name: '鈴木 アイセル', email: 'test_user2@test.com', password_digest: 'password'),
  FactoryGirl.create( :user, name: '田中 ＡＳＬ', email: 'test_user3@test.com', password_digest: 'password'),
  FactoryGirl.create( :user, name: '佐藤 アイセル', email: 'test_user4@test.com', password_digest: 'password'),
  FactoryGirl.create( :user, name: '高橋 アイセル', email: 'test_user5@test.com', password_digest: 'password')
].map(&:id)

shop_ids = [ 
  FactoryGirl.create( :shop, login_id: "test_shop1", name: "料亭AISEL", email: 'test_shop1@test.com', password_digest: 'password'),
  FactoryGirl.create( :shop, login_id: "test_shop2", name: "居酒屋AISEL", email: 'test_shop2@test.com', password_digest: 'password'),
  FactoryGirl.create( :shop, login_id: "test_shop3", name: "AISEL-BAR", email: 'test_shop3@test.com', password_digest: 'password'),
  FactoryGirl.create( :shop, login_id: "test_shop4", name: "AISELレストラン", email: 'test_shop4@test.com', password_digest: 'password'),
  FactoryGirl.create( :shop, login_id: "test_shop5", name: "AISEL亭", email: 'test_shop5@test.com', password_digest: 'password')
].map(&:id)

FactoryGirl.create( :vip, user_id: user_ids[0], shop_id: shop_ids[0], property: 'サッカーが好き。日本酒が好き。')
FactoryGirl.create( :vip, user_id: user_ids[0], shop_id: shop_ids[1], property: '野球が好き。')
FactoryGirl.create( :vip, user_id: user_ids[0], shop_id: shop_ids[2], property: 'スポーツ全般好き。サッカーが得に好き。')
FactoryGirl.create( :vip, user_id: user_ids[0], shop_id: shop_ids[3], property: '日本酒が好き')
FactoryGirl.create( :vip, user_id: user_ids[0], shop_id: shop_ids[4], property: 'ワインが好き')

FactoryGirl.create( :vip, user_id: user_ids[1], shop_id: shop_ids[0], property: '')
FactoryGirl.create( :vip, user_id: user_ids[2], shop_id: shop_ids[0], property: '')
FactoryGirl.create( :vip, user_id: user_ids[3], shop_id: shop_ids[0], property: '')
FactoryGirl.create( :vip, user_id: user_ids[4], shop_id: shop_ids[0], property: '')

main_user = User.find( user_ids[0] )
main_shop = Shop.find( shop_ids[0] )
arrival_log = main_user.arrival_logs.build
arrival_log.arrival_time = Time.local(2001, 5, 20, 23, 59, 59)
arrival_log.shop_id = main_shop.id
arrival_log.save






