# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :app do
    name "AppName"
    package "package.name"

    factory :app_with_builds do
      ignore do
        builds_count 5
      end	     
      after(:create) do |app, evaluator|
        create_list(:build, evaluator.builds_count, app: app)
      end
    end
  end
end
