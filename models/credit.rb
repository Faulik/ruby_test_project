# Model for credit operations
class Credits
  attr_reader :number_of_months, :percentages, :ammount

  def initialize(number_of_months, percentages, ammount)
    @number_of_months = number_of_months
    @percentages = convert_percent(percentages)
    @ammount = ammount
  end

  def get_by_months(payment_type)
    payment_type == 'Usual' ? with_usual_payments : with_equal_payments
  end

  def with_usual_payments
    months = []
    ammount_left = ammount
    credit_payment = ammount / number_of_months
    number_of_months.times do
      percentages_payment = ammount_left * percentages / number_of_months
      full_payment = credit_payment + percentages_payment
      ammount_left -= credit_payment
      months << ([credit_payment, percentages_payment, full_payment, ammount_left])
    end

    months
  end

  def with_equal_payments
    months = []
    ammount_left = ammount
    full_payment = ammount * percentages_per_month * (1 + 1 / ((1 + percentages_per_month)**number_of_months - 1))
    number_of_months.times do
      percentages_payment = ammount_left * percentages_per_month
      credit_payment = full_payment - percentages_payment
      ammount_left -= credit_payment
      months << ([credit_payment, percentages_payment, full_payment, ammount_left])
    end

    months
  end

  private
  
  def convert_percent(percentages)
    percentages / 100
  end

  def percentages_per_month
    @percentages / 12
  end
end
