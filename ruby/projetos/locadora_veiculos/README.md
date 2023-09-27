# Projeto: Locadora de Veículos

## Descrição

Este projeto consiste em um sistema de locadora de veículos na linguagem Ruby no modo puro, desenvolvido afim de praticar os conhecimentos adquiridos até o presente momento. 
O sistema permite que seu usuário cadastre locador, veículo e efetue a locação. 
O sistema calcula o valor total da locação com base em critérios como o tipo de veículo, a quantidade de diárias e a forma de pagamento.

## Classes

### Classe Principal (main.rb)

#### Descrição

A classe main.rb é o ponto de entrada do sistema da locadora de veículos.

#### Funcionalidades Principais

- Coleta de informações do cliente pelo atendente.
- Seleção do tipo de veículo (carro ou moto) e fornecimento de detalhes do veículo a ser locado.
- Definição das datas de retirada e devolução do veículo.
- Escolha do tipo de pagamento (débito, crédito ou dinheiro).
- Cálculo do valor total da locação com base nas informações fornecidas.
- Exibição dos detalhes da locação, incluindo dados do cliente, do veículo e pagamento.

#### Uso da Classe

A classe `main.rb` é responsável por interagir com os atendentes e clientes, coletar informações e coordenar as operações de locação de veículos. Ela faz uso das classes `Locador`, `PessoaFisica`, `PessoaJuridica`, `Veiculo`, `Carro`, `Moto`, `Pagamento`, `PagamentoEmDinheiro`, `PagamentoComCartaoDeDebito`, `PagamentoComCartaoDeCredito` e `Locacao` para executar suas funcionalidades.

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

#### PagamentoEmDinheiro

- Herda de Pagamento

#### PagamentoComCartaoDeDebito

- Herda de Pagamento

#### PagamentoComCartaoDeCredito

- Herda de Pagamento
- Atributo Adicional: Parcelas
- Métodos: exibir (exibe em tela os dados do pagamento, incluindo o número de parcelas)

### Locacao

- Atributos: Locador, Veiculo, Data de Retirada, Data de Devolução, Valor da Locação, Tipo de Pagamento
- Métodos: calcular_valor_total (calcula o valor total da locação com base no tipo de pagamento), exibir_detalhes (exibe em tela os detalhes da locação)

## Técnicas Utilizadas

- Programação Orientada a Objetos (POO)
- Herança
- Encapsulamento
- Polimorfismo
- Leitura de Dados do Usuário
- Tratamento de Exceções
- Modularização
- Boas Práticas de Nomenclatura
- Comentários
- Lógica de Negócios
- Modificação de Atributos
- Organização de Arquivos
- validação de Entrada do Usuário
- Flexibilidade de Extensão
- Utilização de Métodos Construtores
- Agregaçao de Objetos

Além das linhas de códigos, o projeto contém:

- Técnicas de UML (Caso de Uso e Diagrama de Classes)

Esse foi o resumo do projeto Locadora de Veículos..
