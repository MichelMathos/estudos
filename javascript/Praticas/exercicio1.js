/*
Faça um algoritmo que dadas as 3 notas tiradas por um aluno em um semestre
de sua faculdade calcule e imprima a sua nota média e sua classificação
conforme a tabela abaixo:
Média = (nota1 + nota2 + nota3) / 3;

Classificação:
- Média menor que 5, reprovado;
- Média entre 5 e 7, recuperação;
- Média acima de 7, aprovado;
*/

const nota1 = 10;
const nota2 = 3;
const nota3 = 1;

const media = (nota1 + nota2 + nota3) / 3;

if (media < 5){
    console.log('Sua nota foi: ' + media.toFixed(2) + ' = reprovado')
} else if (media >= 5 && media < 7) {
    console.log('Sua nota foi: ' + media.toFixed(2) + ' = recuperação')
} else {
    console.log('Sua nota foi: ' + media.toFixed(2) + ' = aprovado')
}