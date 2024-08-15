// criando métodos para o objeto

const pessoa = {
nome: 'Michel',
idade: 43,

// método descrever
descrever: function (){
    
    console.log(`Meu nome é ${this.nome} e minha idade é ${this.idade}`) //deve-se utiliozar crase no lugar das aspar para surtir a interpolação
}

};

pessoa.descrever();

pessoa.nome = 'Jorge';
pessoa.idade = 70;

pessoa.descrever();