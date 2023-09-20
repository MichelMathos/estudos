require_relative 'veiculo'

class Payment
    attr_reader :amount

    def initialize (amount)
        @amount = amount
    end
