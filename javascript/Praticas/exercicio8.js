/*
    1) Crie uma classe para representar pessoas.
        Para cada pessoa teremos os atributos nome, peso e altura.
        As pessoas devem ter a capacidade de dizer o valor de seu IMC (IMC = peso / (altura * altura)).
        Instancie uma pessoa chamada José que tenha 70kg de peso, 1,75 de altura e, peça ao José para
        dizer o valor do seu IMC;
        */

        class Pessoa {
            nome;
            peso;
            altura;

            constructor (nome, peso, altura){
                this.nome = nome;
                this.peso = peso;
                this.altura = altura;
            }

            calculoIMC () {
                return this.peso / (this.altura * this.altura);
            }

            diagnosticoIMC (imc) {
                if (imc >= 16.0 && imc <= 16.9) {
                    console.log ('Muito abaixo do peso');
                } else if (imc >=17.0 && imc <= 18.4) {
                    console.log ('Abaixo do peso');
                } else if (imc >= 18.5 && imc <= 24.9) {
                    console.log ('Peso normal');
                } else if (imc >= 25.0 && 29.0) {
                    console.log ('Acima do peso');
                } else if (imc >= 30.0 && imc <= 34.9) {
                    console.log ('Obesidade grau I');
                } else if (imc >= 35 && imc <= 40.0) {
                    console.log('Obesidade grau II');
                } else if (imc > 40) {
                    console.log ('Obesidade grau III'); 
                } else {
                    console.log ('Resultado inválido');
                }   
            }
        }

        const jose = new Pessoa ('José', 70, 1.75);
        console.log (jose);
        const imc = jose.calculoIMC();
        console.log (`O IMC de ${jose.nome} é de ${imc.toFixed(2)}`);
        jose.diagnosticoIMC(imc);


        