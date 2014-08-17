# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :build do

    version 1
    apk { File.new("#{Rails.root}/test.apk") } 
  end

end
