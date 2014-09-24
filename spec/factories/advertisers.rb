# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :advertiser do
    sequence :email do |i|
      "advertiser#{i}@example.com"
    end
    sequence :company do |i|
      "company#{i}"
    end
    first_name "Bill"
    last_name  "Low"
    address "1 rue Ste Anne"
    city 'Paris'
    postcode '75001'
    country_code 'FR'
    user
  end
end
