alunos = ['André', 'Sophia', 'Laura','Paulo']
notas = [5, 9, 8, 7.5]

i = 0

# equanto i for menor que o tamanho array
# escreva Aluno tirou a nota
while i < alunos.length
    puts "#{alunos[i]} tirou a nota #{notas[i]}"
    i += 1
end

puts "Esta turma possui #{alunos.length} participantes."