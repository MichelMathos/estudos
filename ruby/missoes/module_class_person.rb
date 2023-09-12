# Definindo o módulo Person e suas classes
module Person
    class Juridic
      attr_accessor :name, :cnpj #Usamos attr_accessor para criar atributos name e cnpj com getter e setter automaticamente.

  
      def initialize(name, cnpj)
        @name = name
        @cnpj = cnpj
      end
  
      def add
        puts "Pessoa Juridica adicionada"
        puts "Nome: #{@name}"
        puts "CNPJ: #{@cnpj}"
      end
    end
  
    class Physical
      attr_accessor :name, :cpf
  
      def initialize(name, cpf)
        @name = name
        @cpf = cpf
      end
  
      def add
        puts "Pessoa Física adicionada"
        puts "Nome: #{@name}"
        puts "CPF: #{@cpf}"
      end
    end
  end
  
  # Exemplo de uso:
  Person::Juridic.new('M.C. Investimentos', '4241.123/0001').add
  Person::Physical.new('José Almeida', '425.123.123-12').add