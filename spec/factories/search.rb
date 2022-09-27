FactoryBot.define do
  factory :search, class: Car do
    make { "Toyota" }
    model { Faker::Vehicle.model(make_of_model: 'Toyota')  }
    distance { Faker::Number.between(from: 0, to: 100000) }
    colors { Faker::Color.color_name.split(',') }
    price { Faker::Number.between(from: 1000, to: 100000) }
    photo { Faker::LoremFlickr.image(size: "500x500", search_terms: ["car", make]) }
  end
end