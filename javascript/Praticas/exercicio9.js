// tabuada
const tabuada = [];
const mult = 9;

console.log(`Tabuada do ${mult}: \n`)
for (let i = 0; i <= 10; i++) {
   tabuada.push(mult * i);
   console.log(`${i} x ${mult} = ` + tabuada[i]);
}