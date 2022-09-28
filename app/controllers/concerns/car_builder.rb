module CarBuilder
  extend ActiveSupport::Concern
  def building_cars(car)
    car_list = []
    car.each do |car|
      car_list << {
        id: car.hash_id,
        make: car.make,
        model: car.model,
        range: {
          unit: car.unit,
          distance: car.distance
        },
        colors: car.colors,
        price: "#{car.price} #{car.currency}",
        photo: car.photo
      }
    end
  render json: car_list
  end
end
