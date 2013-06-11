# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reserve do
    user nil
    shop nil
    status 1
    expected_time "2013-06-11 14:07:30"
  end
end
