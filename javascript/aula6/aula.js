// listas ou arrays

const alunos = ['João', 'Victor', 'Marina'];
console.log(alunos);
console.log(alunos[0]);

// add itens à lista

alunos.push('Renan'); // push insere dinamicamente no final do array
console.log(alunos);

alunos[4] = 'Vinícius'; //inserindo diretamente na posição
console.log(alunos);

// substituindo um item da lista

alunos[3] = 'Jorge';
console.log(alunos);

// removendo itens
alunos.pop(); // remove o último item
console.log(alunos);

console.log(alunos.pop()); // imprime o ultimo item antes de remover
console.log(alunos);