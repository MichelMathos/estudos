# Operadores de associação servem para verificar se os objetos estão presentes dentro de uma sequencia de outro objeto
# pode ser utilizado em listas e em sequencias de caracteres como uma string
# IN = retorna True se o objeto faz parte da sequencia
# NOT IN = retorna True se o objeto não faz parte da sequencia

frutas = ["limão", "uva"]
print("laranja" in frutas)

frutas = ["limão", "uva", "laranja"]
print("laranja" in frutas)

frutas = ["limão", "uva", "Laranja"]
print("laranja" in frutas)

print("morango" in frutas)
print("morango" not in frutas)

curso = "Curso de Python"
print("Python" in curso)
print("Python" not in curso)
print("python" is curso)
print("a" in curso)
print("y" in curso)