require 'rails_helper'

describe 'CAR API' do
  describe 'GET /cars', type: :request do
    before do
      FactoryBot.create_list :car, 5
    end
    it 'returns all cars' do
      get '/api/v1/cars'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end

  describe 'POST /cars' do
    it 'create a new car' do
      expect {
        post '/api/v1/cars', params: {car: { make: 'Honda', model: 'CRV', photo: 'https://loremflickr.com/cache/resized/65535_51403018385_124680afe0_c_500_500_nofilter.jpg' }}
      }.to change {Car.count}.from(0).to(1)
      expect(response).to have_http_status(:created)
    end
    it 'It would not create car without make' do
      expect {
        post '/api/v1/cars', params: {car: {  model: 'CRV', photo: 'https://loremflickr.com/cache/resized/65535_51403018385_124680afe0_c_500_500_nofilter.jpg' }}
      }.not_to change {Car.count}
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'It would not create car without model' do
      expect {
        post '/api/v1/cars', params: {car: {  make: 'Nissan', photo: 'https://loremflickr.com/cache/resized/65535_51403018385_124680afe0_c_500_500_nofilter.jpg' }}
      }.not_to change {Car.count}
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'Would not create car with broken photo URL' do
      expect {
        post '/api/v1/cars', params: {car: { make: 'Honda', model: 'CRV', photo: 'che/resized/65535_51403018385_124680afe0_c_500_500_nofilter'}}
      }.not_to change  {Car.count}
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'Would not create car without photo' do
      expect {
        post '/api/v1/cars', params: {car: { make: 'Honda', model: 'CRV'}}
      }.not_to change  {Car.count}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH/PUT /cars/:id' do
    let!(:car) { FactoryBot.create(:car) }
    it 'updates car params' do
      put "/api/v1/cars/#{car.id}", params: {
        car: {
          make: 'New Maker',
          model: 'New model'
        }
      }
      expect(car.reload.make).to eq('New Maker')
      expect(car.reload.model).to eq('New model')
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Delete /cars/:id' do
    let!(:car) { FactoryBot.create(:car) }
    it 'deletes a book' do
      expect {
        delete "/api/v1/cars/#{car.id}"
      }.to change { Car.count}.to(0)
      expect(response).to have_http_status(:no_content)
    end
  end
end