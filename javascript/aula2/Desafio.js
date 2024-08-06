const precoEtanol = 5.79;
const precoGasolina = 6.66;
const isEtanol = true;
const distanciaEmKm = 100;
const kmPorLitro = 10;

const litrosConsumidos = distanciaEmKm / kmPorLitro;

if (isEtanol === false){
    const gastoMedio = precoEtanol * litrosConsumidos;
    console.log(gastoMedio.toFixed(2));
} else {
   const gastoMedio = precoGasolina * litrosConsumidos;
   console.log(gastoMedio.toFixed(2));
}
