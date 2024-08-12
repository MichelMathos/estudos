/*
Crie uma função que escfeva seu nome
*/

function escreverNome(nome){
    console.log('Meu nome é ' + nome);
}
 escreverNome('Michel Matos 1');

 // invocada imediatamente

 (function (nome){
    console.log('Meu nome é ' + nome);
})('Michel Matos 2');