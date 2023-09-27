class Aresta
    attr_acessor :origin, :destino, peso

    def initialize(origem, destino, peso)
        @origem = origem
        @destino = destino
        @peso = peso
    end

end

#Função para encontrar o representante de um conjunto (usada na implementação de conjuntos disjuntos)
def encontrar_representante(conjunto, i)
    if conjunto[i] == -1
        return i
    else
        return encontrar_representante(conjunto, conjunto[i])
    end
end

#Função para unir dois conjuntos em único conjunto (usada na implementação de conjuntos disjuntos)
def unir_conjuntos(conjunto, x, y)
    x_rayz = encontrar_representante(conjunto, x)
    y_raiz = encontrar_representante(conjunto, y)
    conjunto[x_raiz] = y_raiz
end

#Função principal para encontrar a soma dos pesos da árvore geradora mínima
def soma_arvore_geradora_minima(vertices, arestas)
    arestas.sor_by!