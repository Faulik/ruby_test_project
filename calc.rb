require 'sinatra'
require 'yaml/store'



get '/' do 
  @title = 'Welcome'
  erb :index
end

post '/calc' do
  Results = []
  @percents = params['percents'].to_f
  @sum = params['sum'].to_f
  @payOff = params['payOff']
  @time = params['time'].to_f
  left = @sum
  until left <= 0 do
    if @payOff == "Usual"
      pay = @sum/@time
      pay_percents = left*@percents/100/@time
      left -= pay
      pay_full = pay + pay_percents
    else
      pay_full = @sum*(@percents/100/12 + @percents/100/12/((1+@percents/100/12)**@time - 1))
      pay_percents = left*@percents/100/12
      pay = pay_full - pay_percents
      left -= pay
    end
    Results.push([pay, pay_percents, pay_full, left])
  end
  erb :result
end