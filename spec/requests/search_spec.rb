describe 'CAR Search API' do
  describe 'GET /cars/api/v1/cars?make', type: :request do
    before do
      FactoryBot.create_list :search, 5
    end
    it 'returns all searched cars' do
      get '/api/v1/cars?make=ToYoTa'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'should not find cars' do
      get '/api/v1/cars?make=Nissan'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(0)
    end
  end
  describe 'GET /api/v1/cars?min_price=1000&max_price=100000', type: :request do
    before do
      FactoryBot.create_list :search, 50
    end
    it 'returns all searched cars' do
      get '/api/v1/cars?min_price=1000&max_price=100000'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(50)
    end
    it 'should not find cars within price range' do
      get '/api/v1/cars?min_price=150000'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(0)
    end
  end
end
