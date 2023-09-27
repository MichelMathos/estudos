#Os hashes são similares aos arrays.
# Adfiferença está no acesso aos dados, que ao contrário dos arrays, que se acessa pelos índices,]
#Os hashes se acessa pelas chaves e valores associados a elas.

estados = Hash.new
puts estados

#ou
cidades = {}
puts cidades

#para INSERIR elementos, utilizamos nome_do_hash = {chave: 'elemento'}
estados = {SaoPaulo: 'São Paulo', RiodeJaneiro:'Rio de Janeiro', Acre:'Acre'} #não aceita caracteres especiais para nomear as chaves
puts estados

#para ADICIONAR um novo valor
estados [:RioGrandedoSul] = "Rio Grande do Sul" #irá para o final da fila
puts estados

#ver todas as chaves
puts estados.keys

#ver todos os valores

puts estados.values

#EXCLUIR elementos, inrformar a chave
estados.delete(:Acre) #entre parênteses
puts estados

#ver o tamanho do hash -> quanto elementos possui
puts estados.size

#conferir se um hash está vazio
puts estados.empty?
puts cidades.empty?
