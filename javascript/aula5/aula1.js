// CONSTRUCTOR

//classe é o modelo do objeto, como ele deve ser e se comportar, é a definição da estrutura que será utilizada por um objeto
class Pessoa {
    
    constructor (nome, idade) { //para estes casos, as funções não precisam ser literais, pois "descrever" passa ser um método
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