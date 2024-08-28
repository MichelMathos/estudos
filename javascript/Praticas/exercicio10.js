// somente numeros pares

const numerosPares =[10, 15, 12, 22, 5, 71, 40, 35, 1, 90, 91];

for (let i = 0; i < numerosPares.length; i++) {
    
    if (numerosPares[i] % 2 === 0) {
        console.log(numerosPares[i]);
    }
}