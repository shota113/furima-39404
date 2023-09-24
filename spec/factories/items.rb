FactoryBot.define do
  factory :item do
    association :user

    name            {Faker::Name.name}
    content         {Faker::Lorem.context}
    price           {Faker::Number.between(from: 300, to: 9_999_999)}
    category_id     {Faker::Number.between(from: 2, to: 11)}
    condition_id    {Faker::Number.between(from: 2, to: 7)}
    shipment_id     {Faker::Number.between(from: 2, to: 4)}
    prefecture_id   {Faker::Number.between(from: 2, to: 48)}
    cost_id         {Faker::Number.between(from: 2, to: 3)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test-image.png'), filename: 'test-image.png')
    end
  end
end
