// OBJETOS

const michel = {
nome: 'Michel S Matos',
idade: 43
};


console.log(michel.nome);
console.log(michel.idade);
console.log(michel);

// add atributos
michel.altura = 176;

console.log(michel);
console.log(michel.altura);

// deletar atributos
delete michel.idade;

console.log(michel);