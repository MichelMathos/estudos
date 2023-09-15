class Locador
    attr_reader :name, :address, :phone, :email
    def initialize(name, address, phone, email)
        @name = name
        @address = address
        @phone = phone
        @email = email
    end
end

class PhysicalPerson < Locador
    attr_reader :cpf
    def initialize(cpf)
        super(name, address, phone, email)
        @cpf = cpf
    end
end

class LegalPerson < Locador
    attr_reader :cnpj
    def initialize(cnpj)
        super(name, address, phone, email)
        @cnpj = cnpj
    end
end

puts "PREENCHA O FORMULÁRIO COM SEUS DADOS PESSOAIS: "

physicalPerson = PhysicalPerson.new
  
    puts "Nome: "
    physicalPerson.name = gets
    puts "Endereço: "
    physicalPerson.address = gets
    puts "Telefone: "
    physicalPerson.phone = gets
    puts "E-mail: "
    physicalPerson.email = gets
    puts "CPF: "
    physicalPerson.cpf = gets