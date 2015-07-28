# Test cases for main routes
describe 'Calc' do

  def app
    @app ||= CalcApp
  end

  describe 'get /' do
    it 'should have valid title' do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to include('Кредитний калькулятор')
    end
  end

  describe 'get /calc' do
    it 'should calc right for usual payment type' do
      post '/calc', URI.encode_www_form(percentages: 10,
                                        ammount: 100,
                                        payments_type: 'Usual',
                                        number_of_months: 6)
      expect(last_response).to be_ok
      expect(last_response.body).to include('105.83')
      expect(last_response.body).to include('33.33')
    end

    it 'should calc right for equal payment type' do
      post '/calc', URI.encode_www_form(percentages: 10,
                                        ammount: 100,
                                        payments_type: 'Equal',
                                        number_of_months: 6)
      expect(last_response).to be_ok
      expect(last_response.body).to include('102.94')
      expect(last_response.body).to include('33.89')
    end
  end
end
