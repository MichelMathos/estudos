# Projeto: Locadora de Veículos

## Descrição

Este projeto consiste em um sistema de locadora de veículos na linguiagem Ruby. Ele permite que o usuário do sistema cadastre locador, veículo e efetue a locação. O sistema calcula o valor total da locação com base em critérios como o tipo de veículo, a quantidade de diárias e a forma de pagamento.

## Classes

### Locador

- Atributos: Nome, Endereço, Telefone, Email
- Métodos: exibir (exibe em tela os dados do locador)

#### PessoaFísica

- Herda de Locador
- Atributo Adicional: CPF
- Métodos: exibir (exibe em tela os dados do locador, incluindo o CPF)

#### PessoaJuridica

- Herda de Locador
- Atributo Adicional: CNPJ
- Métodos: exibir (exibe em tela os dados do locador, incluindo o CNPJ)

### Veículo

- Atributo: Categoria, Marca, Cor, Ano
- Métodos: valor_diaria (calcula o valor da diária com base na categoria - carr/moto), taxa_juros (calcula a taxa de juros para pagamento com cartão de crédito), exibir (exibe em tela os dados do veículo)

#### Carro

- Herda de Veiculo
- Atributo Adicional: Portas
- Métodos: exibir (exibe em tela os dados do veículo, incluindo a quantidade de portas)

#### Moto

- Herda de Veiculo
- Não possui atributos e nem métodos adicionais

### Pagamento

- Atributo: Valor
- Métodos: exibir (exibe os dados do pagamento)

