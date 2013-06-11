# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    want nil
    shop nil
    status 1
    selected 1
  end
end
