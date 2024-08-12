/*
Função verifica idade
 - se menor de 18 anos não é adulto
 - se maior de 18 anos é adulto
 */

 function verificarIdade(idade){
    if (idade < 18) {
        console.log('É menor de idade');
    } else {
        console.log('É adulto')
    }
 }

 verificarIdade(18);
