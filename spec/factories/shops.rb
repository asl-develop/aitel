#coding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shop do
    sequence(:name) { |n| "name_shop#{n}" }
    sequence(:email) { |n| "shop#{n}@test.com" }
    sequence(:login_id) { |n| "shop#{n}" }
    password_digest "password"
  end
end
