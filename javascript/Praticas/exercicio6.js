/*
Faça um programa para calcular o valor de uma viajem.

Você terá 5 variaveis, sendo elas:
1 - Preço do etanol;
2 - Preço da gasolina;
3 - O tipo de combustível que está no seu carro;
4 - Gasto médio de combustível do carro por KM;
5 - Distância em KM da viagem.

Imprima no console o valor que será gasto para realizar esta viagem.
*/

const precoEtanol = 5.79;
const precoGasolina = 6.66;
const isEtanol = true;

function litrosConsumidos(distanciaEmKm, kmPorLitro) {
    return distanciaEmKm / kmPorLitro;
}

function gastoMedio(precoCombustivel, litros) {
    return precoCombustivel * litros;
}

// Main
(function () {
    const distanciaEmKm = 100;
    const kmPorLitro = 10;
    
    const litros = litrosConsumidos(distanciaEmKm, kmPorLitro);
    let gasto;

    if (isEtanol) {
        gasto = gastoMedio(precoEtanol, litros);
    } else {
        gasto = gastoMedio(precoGasolina, litros);
    }

    console.log(gasto.toFixed(2));
})();
