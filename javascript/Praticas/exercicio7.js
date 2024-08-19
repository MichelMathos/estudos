/*
    1 - Crie uma classe para representar carros.
    Os carros possuem uma marca, uma cor e um gasto médio de combustível por Km rodado.
    2 - Crie um método que, dada a quantidade de quilômetros e o preço do combustível, 
    nos dê o valor gasto em reais para realizar este percurso.
*/

class Carro {
    marca;
    cor;
    gastoMedioPorKm;

    constructor (marca, cor, gastoMedioPorKm) {
        this.marca = marca;
        this.cor = cor;
        this.gastoMedioPorKm = gastoMedioPorKm;
    }

    valorGasto (precoCombustivel, percursoEmKm ) {
    
        return percursoEmKm * this.gastoMedioPorKm * precoCombustivel;
    }
}

const uno = new Carro('Fiat', 'vermelho', 1/12)
console.log(carro1);
const gastoCalculado = carro1.valorGasto(5, 70);
console.log(`O gasto calculado para realizar a viagem foi de $${gastoCalculado.toFixed(2)}`);
