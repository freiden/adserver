# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence :email do |i|
      "user#{i}@example.com"
    end
    password "password123"
    password_confirmation "password123"
    first_name "John"
    last_name "Doe"
  end

  factory :administrator, :class => :user do
    first_name "John"
    last_name "Smith"
    sequence :email do |i|
      "administrator#{i}@example.com"
    end
    password "password123"
    password_confirmation "password123"
    role "administrator"
  end
end
