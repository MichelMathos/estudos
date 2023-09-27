#Informe 3 chaves e os elementos que pertencerão a cada chave:"
print "Chave 1: "
key1 = gets

print "Elemento 1: "
value1 = gets

print "Chave 2: "
key2 = gets

print "Elemento 2: "
value2 = gets

print "Chave 3: "
key3 = gets

print "Elemento 3: "
value3 = gets

hash = { key1 => value1, key2 => value2, key3 => value3}

hash.each do |key, value| #percorrendo a hash
  puts "Uma das chaves é #{key} e seu valor é #{value}"
end

