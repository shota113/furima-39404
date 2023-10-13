FactoryBot.define do
  factory :form do

    item {1}
    user_id {1}
    postcode         {Faker::Number.between(from: 001, to: 999).to_s + "-" + Faker::Number.between(from: 0001, to: 9999).to_s}
    prefecture_id    {Faker::Number.between(from: 2, to: 48)}
    city             {Faker::Number.between(from: 300, to: 9_999_999)}
    street_number    {"坂道4-2"}
    building_name    {Faker::Internet.name}
    tel              {"12345678912"}
  end
end
