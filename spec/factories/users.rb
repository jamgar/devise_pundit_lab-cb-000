FactoryGirl.define do
  factory :user do
    confirmed_at Time.now
    sequence(:name) { |n| "Test User#{n}"}
    # name "Test User"
    sequence(:email) { |n| "user#{n}@example.com" }
    # email "test@example.com"
    password "please123"

    trait :admin do
      role 'admin'
    end

  end
end
