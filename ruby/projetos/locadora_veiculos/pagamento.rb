#require_relative 'veiculo'

class Payment
    attr_reader :amount

    def initialize (amount)
        @amount = amount
    end
end

class Cash < Payment
    def initialize
        super(daily_rate)
    end

    def display
        puts "Pagamento em dinheiro - valor da diária: R$#{@amount}"
    end
end

class DebitCard < Payment
    def initialize
        super(daily_rate) # Acessa a variável daily_rate definida em veiculo.rb
    end

    def display
        puts "Pagamento com cartão de débito - Valor da diária: R$#{@amount}"
    end
end

class CreditCard < Payment
    def initialize(installments)
        # Adicionar juros para pagamento em crédito com mais de uma parcela
        if installments > 1
            interest_rate = 0.98 / 100.0 # Taxa de juros mensal de 0.98%
            daily_rate += daily_rate * interest_rate
        end

        super(daily_rate) # Acessa a variável daily_rate definida em veiculo.rb
    end

    def display
        puts "Pagamento com cartão de crédito - Valor da diária: R$#{@amount}"
    end
end