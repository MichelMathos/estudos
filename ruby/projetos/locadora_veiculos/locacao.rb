require_relative 'locator'
require_relative 'vehicle'
require_relative 'payment'

class Locacao
  attr_reader :locator, :vehicle, :pickup_date, :return_date, :rental_amount, :payment_type

  def initialize(locator, vehicle, pickup_date, return_date, rental_amount, payment_type)
    @locator = locator
    @vehicle = vehicle
    @pickup_date = pickup_date
    @return_date = return_date
    @rental_amount = rental_amount
    @payment_type = payment_type
  end

  def calculate_total_amount
    # Calculando o número de dias de locação
    rental_days = (Date.parse(return_date) - Date.parse(pickup_date)).to_i

    # Obtendo os valores específicos do veículo e do pagamento
    daily_rate = vehicle.type == "car" ? vehicle.car_daily_rate : vehicle.motorcycle_daily_rate
    payment_value = payment_type.type

    # Obtendo a taxa de juros do veículo
    interest_rate = vehicle.interest_rate

    # Calculando o valor total com base no tipo de pagamento
    if payment_value == "debit"
      total_amount = daily_rate * rental_days
    elsif payment_value == "credit"
      total_amount = (daily_rate * rental_days) * interest_rate
    elsif payment_value == "cash"
      total_amount = daily_rate * rental_days
    else
      raise "Tipo de pagamento inválido"
    end

    total_amount
  end

  def display_details
    total_amount = calculate_total_amount
    rental_days = (Date.parse(return_date) - Date.parse(pickup_date)).to_i

    puts "Detalhes da Locação:"
    puts "Locador: #{locator.display}"
    puts "Veículo: #{vehicle.display}"
    puts "Pagamento: #{payment_type.display}"
    puts "Data de retirada: #{pickup_date}"
    puts "Data de devolução: #{return_date}"
    puts "Número de dias de locação: #{rental_days}"
    puts "Valor total: #{total_amount}"
  end
end
