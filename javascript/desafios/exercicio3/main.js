/*
    3) Faça um programa que calcule e imprima o salário a ser transferido 
    para um funcionário.
    Para realizar o cálculo, receba o valor bruto do salário e o adcional dos benefícios.
    O salário a ser transferido é calculado da seguinte maneira:

        Valor bruto do salário - percentual de imposto mediante a faixa salarial + adicional dos benefíocios.

    Para alcular o percentual de imposto segue as alíquotas:

        De R$ 0.00 a R$ 1100.00 = 5.00%
        De R$ 1100.01 a R$ 2500.00 = 10.00%
        Maior que R$ 2500.00 = 15.00%
    
    Exemplo:
        Entradas:
            2000
            250
        
        Saída:
            2050.00


*/

const { gets, print } = require ('./funcoes-auxiliares');

const salarioBruto = gets();
const valorBeneficios = gets();
const valorDeTransferencia = 0;

function calculoDescontoPercentual (valor, percentual) {
    return valor * (percentual / 100);
}

function aliquota (salarioBruto) {
    if (salarioBruto < 1100) {
        return 5;
    } else if (salarioBruto >= 1100.01 && salarioBruto < 2500) {
        return 10;
    } else {
        return 15;
    }
}

const aliquotaImposto = aliquota(salarioBruto);
const valorDoImposto = calculoDescontoPercentual(salarioBruto, aliquotaImposto);

const salarioATransferir = salarioBruto - valorDoImposto + valorBeneficios;

print (salarioATransferir);