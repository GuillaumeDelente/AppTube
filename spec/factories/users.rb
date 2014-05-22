# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    email
    password "password{n}"

    factory :user_with_apps do
      ignore do
        apps_count 5
      end
      after(:create) do |user, evaluator|
        create_list(:app, evaluator.apps_count, user: user)
      end
    end
  end
end
