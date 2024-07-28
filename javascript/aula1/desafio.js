/*
Faça um programa para calcular o valor de uma viagem.

Você terá 3 variáveis sendo elas:
1 - Preço do combustível;
2 - Gasto médio de combustível do carro por km;
3 - Distância em KM da viagem.

Imprima no console o valor que será gasto para realizar esta viagem.
*/

const preco = 5.79;
const kmMedioPorLitro = 12;
const distanciaKm = 1580;

const litrosConsumidos = distanciaKm / kmMedioPorLitro; 
const gastoFinal = litrosConsumidos * preco;


console.log(gastoFinal.toFixed(2)); // .toFixed converte o valor para string com 2 casas decimais
