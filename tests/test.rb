ENV['RACK_ENV'] = 'test'

require_relative '../calc'
require 'test/unit'
require 'rack/test'

# Test cases for main routes
class CalcTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    CalcApp
  end

  def test_main_page
    get '/'
    assert last_response.ok?
    assert last_response.body.include?('Кредитний калькулятор')
  end

  def test_result_page_usual
    post '/calc', URI.encode_www_form(percentages: 10,
                                      ammount: 100,
                                      payments_type: 'Usual',
                                      number_of_months: 6)
    assert last_response.ok?
    assert last_response.body.include?('105.83')
    assert last_response.body.include?('33.33')
  end

  def test_result_page_equal
    post '/calc', URI.encode_www_form(percentages: 10,
                                      ammount: 100,
                                      payments_type: 'Equal',
                                      number_of_months: 6)
    assert last_response.ok?
    assert last_response.body.include?('102.94')
    assert last_response.body.include?('33.89')
  end
end
