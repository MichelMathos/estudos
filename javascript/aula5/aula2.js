class Pessoa {
    constructor(nome, idade) {  // Adiciona o construtor para inicializar 'nome' e 'idade'
        this.nome = nome;
        this.idade = idade;
    }
}

function compararPessoas (p1, p2) {
    if (p1.idade > p2.idade) {
        console.log(`${p1.nome} é mais velho(a) que ${p2.nome}`);
    } else if (p2.idade > p1.idade) {
        console.log (`${p2.nome} é mais velho(a) que ${p1.nome}`);
    } else {
        console.log(`${p1.nome} e ${p2.nome} tem a mesma idade`);
    }
}

const jose = new Pessoa('Jose', 31);
const maria = new Pessoa('Maria', 30);

compararPessoas(jose, maria);