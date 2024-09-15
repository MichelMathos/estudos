nome = input("Informe o seu nome: ")
idade = input("Informe sua idade: ")

print(nome, idade) #i mprime os valores de nome e idade
print(nome, idade, end="...\n") # imprime no final os ... e uma quebra de linha
print(nome, idade, sep="#") # sep é de separador de valores, no lugar do espaço em branco entra o #
print(nome, idade, sep="#", end="...\n") # é possível usar sep e end em conjunto

