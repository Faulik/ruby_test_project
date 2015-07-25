module Sinatra
  module CalcApp
    module Routing
      module Main

        def self.registered(app)

          app.get '/' do 
            erb :index
          end

          app.post '/calc' do
            @percents = params['percents'].to_f
            @sum = params['sum'].to_f
            @payOff = params['payOff']
            @time = params['time'].to_f
            case @payOff
            when "Usual"
              @Results = usual_type @sum, @percents, @time
            when "Equal"
              @Results = equal_type @sum, @percents, @time 
            end
            erb :result
          end
          
        end
        
      end
    end
  end
end