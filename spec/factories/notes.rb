# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
    text { Faker::BaconIpsum.paragraph}
  end
end
