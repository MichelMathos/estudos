-- Tabela de Usuários
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(50) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    endereco TEXT,
    telefone VARCHAR(15),
    email VARCHAR(100) NOT NULL,
    papel VARCHAR(20) NOT NULL -- admin, vendedor, estoquista...
);

-- Tabela de Produtos
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY.
    nome VARCHAR(100) NOT NULL,
    marca VARCHAR(50),
    preco DECIMAL(10,2) NOT NULL,
    quantidade INTEGER NOT NULL
);