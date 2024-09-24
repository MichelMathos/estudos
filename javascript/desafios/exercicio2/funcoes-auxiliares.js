const entradas = [5, 13, 4, 7, 10, 8]; // Todos os números fazem parte da análise
let i = 0;

function gets() {
    const valor = entradas[i];
    i++;
    return valor;
}

function print(texto) {
    console.log(texto);
}

module.exports = { gets, print };
