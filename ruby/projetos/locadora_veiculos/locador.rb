class Locador
  attr_reader :nome, :endereco, :telefone, :email

  def initialize(nome, endereco, telefone, email)
    @nome = nome
    @endereco = endereco
    @telefone = telefone
    @email = email
  end

  def exibir
    puts "Nome: #{@nome}"
    puts "Endereço: #{@endereco}"
    puts "Telefone: #{@telefone}"
    puts "E-mail: #{@email}"
  end
end

class PessoaFisica < Locador
  attr_reader :cpf

  def initialize(nome, endereco, telefone, email, cpf)
    super(nome, endereco, telefone, email)
    @cpf = cpf
  end

  def exibir
    super
    puts "CPF: #{@cpf}"
  end
end

class PessoaJuridica < Locador
  attr_reader :cnpj

  def initialize(nome, endereco, telefone, email, cnpj)
    super(nome, endereco, telefone, email)
    @cnpj = cnpj
  end

  def exibir
    super
    puts "CNPJ: #{@cnpj}"
  end
end
