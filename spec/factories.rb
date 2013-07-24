require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "my-#{Time.now.to_i}#{n}@factory.com" }
    password              '123456789'
    password_confirmation '123456789'
  end

  factory :account do
    name "account_name"
    sequence(:subdomain){|n| "account#{n}"}
  end
end