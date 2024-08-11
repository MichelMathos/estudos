/*
Função Invocada Imediatamente
 - a diferença do função invocada imediatamente está em ela ficar isolada entre parenteses
 e posteriormente ser ser invocada sem a necesidade de mencioná-la
 - não é preciso nomeá-la, é uma função anônima
- é um código criado para ser executado uma única vez
*/

function calcularIMC(peso, altura){
    return peso / Math.pow(altura, 2)
}

function classificarIMC(imc){
    if (imc < 18.5) {
        return ('Abaixo do peso');
     } else if (imc >= 18.5 && imc < 25) {
        return ('Peso normal');
     } else if (imc >= 25 && imc < 30) {
        return ('Acima do peso');
     } else if (imc >= 30 && imc < 40){
        return ('Obeso');
     }else {
        return ('Obesidade grave');
     }
}

// MAIN()

(function() {
const peso = 75;
const altura = 1.75;

const imc = calcularIMC(peso, altura);
console.log(classificarIMC(imc));
})(); //utiliza-se apenas os () para invocar a função main que está isolada entre parenteses.