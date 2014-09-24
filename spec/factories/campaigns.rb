# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    sequence :name do |i|
      "campaign#{i}"
    end
    budget 1_000
    start_date DateTime.now
    end_date DateTime.now + 3.months
    link "http://www.example.com"
    country_code 'FR'
    creative "http://www.example.com"
    advertiser
  end
end
