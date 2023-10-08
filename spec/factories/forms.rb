FactoryBot.define do
  factory :form do


    postcode         {"123-4567"}
    prefecture_id    {Faker::Number.between(from: 2, to: 48)}
    city             {Faker::Number.between(from: 300, to: 9_999_999)}
    street_number    {"坂道1-13"}
    building_name    {Faker::Internet.name}
    tel              {"12345678912"}
  end
end
