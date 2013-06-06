# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@test.com" }
    password_digest "password"
    
    factory :user_with_want, parent: :user do
      after(:create){ |user| create(:want, user: user)} 
    end
  end



end
