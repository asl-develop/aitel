# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vip_request do
    user nil
    shop nil
    status 1
  end
end
