# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :want do
    user nil
    amount 1
    from_date "2013-06-11 11:28:13"
    locked 1
  end
end
