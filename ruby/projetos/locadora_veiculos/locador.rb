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
    def initialize(name, address, phone, email, cpf)
        super(name, address, phone, email)
        @cpf = cpf
    end
end

class LegalPerson < Locador
    attr_reader :cnpj
    def initialize(name, address, phone, email, cnpj)
        super(name, address, phone, email)
        @cnpj = cnpj
    end
end

puts "PREENCHA O FORMULÁRIO COM SEUS DADOS PESSOAIS: "

print "Nome: "
name = gets.chomp 

print "Endereço: "
address = gets.chomp

print "Telefone: "
phone = gets.chomp

print "E-mail: "
email = gets.chomp

choice = nil

while choice != "F" && choice != "J"
  puts "Você é uma Pessoa Física (F) ou Jurídica (J)?"
  choice = gets.chomp.strip.upcase  # Use upcase para garantir que a entrada esteja em letras maiúsculas

  if choice != "F" && choice != "J"
    puts "Opção inválida. Insira 'F' para Pessoa Física ou 'J' para Pessoa Jurídica."
  end
end

if choice == "F"
  print "CPF: "
  cpf = gets.chomp

  physicalPerson = PhysicalPerson.new(name, address, phone, email, cpf)

  puts "Dados Pessoais:"
  puts "Nome: #{physicalPerson.name}"
  puts "Endereço: #{physicalPerson.address}"
  puts "Telefone: #{physicalPerson.phone}"
  puts "E-mail: #{physicalPerson.email}"
  puts "CPF: #{physicalPerson.cpf}"
elsif choice == "J"
  print "CNPJ: "
  cnpj = gets.chomp

  legalPerson = LegalPerson.new(name, address, phone, email, cnpj)
  
  puts "Dados Pessoais:"
  puts "Nome: #{legalPerson.name}"
  puts "Endereço: #{legalPerson.address}"
  puts "Telefone: #{legalPerson.phone}"
  puts "E-mail: #{legalPerson.email}"
  puts "CNPJ: #{legalPerson.cnpj}"
else
  puts "Opção inválida!"
end