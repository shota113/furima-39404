FactoryBot.define do
  factory :form do

    postcode         {Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id    {Faker::Number.between(from: 2, to: 48)}
    city             {Faker::Number.between(from: 300, to: 9_999_999)}
    street_number    {"坂道4-2"}
    building_name    {Faker::Internet.name}
    tel              {"12345678912"}
    token            {"tok_abcdefghijk00000000000000000"}
  end
end
