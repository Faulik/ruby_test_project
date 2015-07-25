module Sinatra
  module CalcApp
    module Helpers

      def usual_type(sum, percents, time)
        results = []
        left = sum
        pay = sum/time
        until left.round <= 0 do
          pay_percents = left*percents/100/time
          pay_full = pay + pay_percents
          left -= pay
          results.push([pay, pay_percents, pay_full, left])
        end
        return results
      end

      def equal_type(sum, percents, time)
        results = []
        left = sum
        pay_full = sum*(percents/100/12 + percents/100/12/((1+percents/100/12)**time - 1))
        until left.round <= 0 do
          pay_percents = left*percents/100/12
          pay = pay_full - pay_percents
          left -= pay
          results.push([pay, pay_percents, pay_full, left])
        end
        return results
      end

      def sum_round(arr, index)
        return arr.inject(0) { |sum, x| sum + x[index] }.round(2)
      end  

    end
  end  
end
