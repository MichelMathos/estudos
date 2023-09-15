class Locador
    attr_reader :name, :address, :phone, :email
    def initialize(name, address, phone, email)
        @name = name
        @address = address
        @phone = phone
        @email = email
    end

    def display
        puts "\nDados Pessoais:"
        puts "Nome: #{@name}"
        puts "Endereço: #{@address}"
        puts "Telefone: #{@phone}"
        puts "E-mail: #{@email}"
    end
end

class PhysicalPerson < Locador
    attr_reader :cpf
    def initialize(name, address, phone, email, cpf)
        super(name, address, phone, email)
        @cpf = cpf
    end

    def display
        super
        puts "CPF: #{@cpf}"
    end
end

class LegalPerson < Locador
    attr_reader :cnpj
    def initialize(name, address, phone, email, cnpj)
        super(name, address, phone, email)
        @cnpj = cnpj
    end

    def display
        super
        puts "CNPJ: #{@cnpj}"
    end
end

puts "\nPREENCHA O FORMULÁRIO COM SEUS DADOS PESSOAIS:"

print "\nNome: "
name = gets.chomp 

print "Endereço: "
address = gets.chomp

print "Telefone: "
phone = gets.chomp

print "E-mail: "
email = gets.chomp

choice = nil

while choice != "F" && choice != "J"
  puts "\nVocê é uma Pessoa Física (F) ou Jurídica (J)?"
  choice = gets.chomp.strip.upcase  

  if choice != "F" && choice != "J"
    puts "\nOpção inválida. Insira 'F' para Pessoa Física ou 'J' para Pessoa Jurídica."
  end
end

if choice == "F"
  print "CPF: "
  cpf = gets.chomp

  physicalPerson = PhysicalPerson.new(name, address, phone, email, cpf)
  physicalPerson.display 
elsif choice == "J"
  print "CNPJ: "
  cnpj = gets.chomp

  legalPerson = LegalPerson.new(name, address, phone, email, cnpj)
  legalPerson.display
  
else
  puts "\nOpção inválida!"
end