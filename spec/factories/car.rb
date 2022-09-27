FactoryBot.define do
  factory :car do
    make { Faker::Vehicle.manufacture }
    model { Faker::Vehicle.model }
    distance { Faker::Number.between(from: 0, to: 100000) }
    colors { Faker::Color.color_name.split(',') }
    price { Faker::Number.between(from: 1000, to: 100000) }
    photo { Faker::LoremFlickr.image(size: "500x500", search_terms: ["car", make]) }
  end
end