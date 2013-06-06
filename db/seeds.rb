# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
FactoryGirl.create( :user, email: 'test_user@test.com', password_digest: 'password')

#10.times { FactoryGirl.create( :user_with_want )}

FactoryGirl.create( :shop, login_id: "test_shop, name", name: "AISEL", email: 'test_shop@test.com', password_digest: 'password')

FactoryGirl.create( :vip, user_id: 1, shop_id: 1, property: 'password')


