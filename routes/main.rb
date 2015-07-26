require_relative '../models/credit'

module Sinatra
  module CalcApp
    module Routing
      # Routes for the main pages
      module Main
        def self.registered(app)
          app.get '/' do
            erb :index
          end

          app.post '/calc' do
            param :percentages,       String, required: true, transform: :to_f
            param :ammount,           String, required: true, transform: :to_f
            param :payments_type,     String, required: true
            param :number_of_months,  String, required: true, transform: :to_i

            @percentages = params[:percentages]
            @ammount = params[:ammount]
            @payments_type = params[:payments_type]
            @number_of_months = params[:number_of_months]

            @months =
              Credits.new(params[:number_of_months], params[:percentages], params[:ammount])
                     .get_by_months(params[:payments_type])
            erb :index
          end
        end
      end
    end
  end
end
