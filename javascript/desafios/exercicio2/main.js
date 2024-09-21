/*
    2) Faça um programa que receba uma sequência de números e imprima o maior número par e o menor número ímpar.

    Exemplo:
        Entradas:
            5
            13
            4
            7
            10
            8
        Saída:
            Maior número par: 10
            Menor número ímpar: 5
*/

const { gets, print } = require('./funcoes-auxiliares');

const n = gets(); // Convertendo a quantidade de números para inteiro
let maiorNumeroPar = null;
let menorNumeroImpar = null;

for (let i = 0; i < n; i++) {
    const numero = gets(); // Convertendo a entrada para número inteiro

    if (numero % 2 === 0) { // Verifica se o número é par
        if (maiorNumeroPar === null || numero > maiorNumeroPar) {
            maiorNumeroPar = numero;
        }
    } else { // Caso contrário, é ímpar
        if (menorNumeroImpar === null || numero < menorNumeroImpar) {
            menorNumeroImpar = numero;
        }
    }
}

// Exibe os resultados
    print("Maior número par: " + maiorNumeroPar);
    print("Menor número ímpar: " + menorNumeroImpar);