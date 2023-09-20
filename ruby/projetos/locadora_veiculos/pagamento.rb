require_relative 'veiculo'

class Payment
    attr_reader :amount

    def initialize (amount)
        @amount = amount
    end
end

class Cash < Payment
    def initialize(vehicle_type)
        daily_rate = case vehicle_type
                    when "C" then 200.0
                    when "M" then 50.0
                    else 00
                    end
        super(daily_rate)
    end

    def display
        puts "Pagamento em dinheiro - valor da diária: R$#{@amount}"
    end
end

class Debitcard < Payment
    def initialize(vehicle_type)
        daoly_rate = case vehicle_type
        when "C" then 200.0
        when "M" then 50.0
        end

        super(daily_rate)
    end

    def display
        puts "Pagamento com cartão de débito - Valor da diária: R$#{amount}"
    end
end


