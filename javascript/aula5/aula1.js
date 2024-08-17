// CONSTRUCTOR
// A importância de definir um constructor está diretamente relacionada às
// necessidades de inicialização dos objetos criados a partir da classe.
// Isso permite que cada instância da classe tenha valores personalizados.
// É importante salieantar que todas as instâncias passam pelo constructor, a diferença está em se definir explicitamente ou não
// A definição explicita está presente no exemplo abaixo. Quando não explícita o próprio javascript cria o constructor de de forma "anônima"
class Pessoa {
    
    constructor (nome, idade) { //
       this.nome  = nome;
       this.idade = idade;
       this.anoDeNascimento = 2024 - idade;
    }

    descrever() {
        console.log(`Meu nome é ${this.nome} e minha idade é ${this.idade}`);
    }
}

// instanciando
//objeto é a classe instanciada, ou seja, é a utilização da classe para algo concreto, que será executado com dados específicos
const michel = new Pessoa('Michel', 43);

console.log(michel);
michel.descrever();