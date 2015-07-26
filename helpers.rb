module Sinatra
  module CalcApp
    # General app helpers
    module Helpers
      def sum_round(array, index)
        array.inject(0) { |a, e| a + e[index] }.round(2)
      end
    end
  end
end
