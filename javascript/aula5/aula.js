// CLASSES E INSTÂNCIAS

//classe é o modelo do objeto, como ele deve ser e se comportar, é a definição da estrutura que será utilizada por um objeto
class Pessoa {
    nome;
    idade;

    descrever () { //para estes casos, as funções não precisam ser literais, pois "descrever" passa ser um método
        console.log (`Meu nome é ${this.nome} e minha idade é ${this.idade}`);
    }
}

// instanciando
//objeto é a classe instanciada, ou seja, é a utilização da classe para algo concreto, que será executado com dados específicos
const michel = new Pessoa();
michel.nome = 'Michel Matos';
michel.idade = 43;

console.log(michel);
michel.descrever();