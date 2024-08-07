/*
    Elabore um algorítmo que calcule o que deve ser pago por um produto,
    considerando o preço normal de etiqueta e a escolha da condição de pagamento.
    Utilize os códigos da tabela a segiur para ler qual a contição de pagamento
    escolhida e efetuar o cálculo adequado.

    Código Condição de pagamento:

    [1] - Á vista Débito, recebe 10% de desconto;
    [2] - À vista no Dinheiro ou PIX, recebe 15% de desconto;
    [3] - Em duas vezes, preço normal de etiqueta sem juros;
    [4] - Acima de duas vezes, preço normal de etiqueta mais juros de 10%;
*/

const precoEtiqueta = 130.00;
const condicaoPagamento = 1;

if (condicaoPagamento === 1) {
    const valorAPagar = precoEtiqueta - (precoEtiqueta* 0.10);
    console.log (valorAPagar.toFixed(2));
} else if (condicaoPagamento === 2) {
    const valorAPagar = precoEtiqueta - (precoEtiqueta * 0.15);
    console.log (valorAPagar.toFixed(2));
} else if (condicaoPagamento === 3) {
    console.log(precoEtiqueta.toFixed(2))
} else if (condicaoPagamento === 4) {
    const valorAPagar = precoEtiqueta + (precoEtiqueta * 0.10);
    console.log(valorAPagar.toFixed(2));
}