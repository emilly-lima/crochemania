-- =============================================================================
-- CROCHÊ MANIA — Script de Criação do Banco de Dados PostgreSQL (SMD0052)
-- =============================================================================

-- Tabela de Usuários (Clientes e Administradores)
CREATE TABLE IF NOT EXISTS usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    login VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    administrador BOOLEAN NOT NULL DEFAULT FALSE
);

-- Tabela de Categorias
CREATE TABLE IF NOT EXISTS categoria (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

-- Tabela de Produtos
CREATE TABLE IF NOT EXISTS produto (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    preco NUMERIC(10,2) NOT NULL,
    foto VARCHAR(255),
    quantidade INTEGER NOT NULL,
    categoria_id INTEGER NOT NULL REFERENCES categoria(id) ON DELETE RESTRICT
);

-- Tabela de Vendas
CREATE TABLE IF NOT EXISTS venda (
    id SERIAL PRIMARY KEY,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_id INTEGER NOT NULL REFERENCES usuario(id) ON DELETE CASCADE
);

-- Tabela Associativa de Itens da Venda
CREATE TABLE IF NOT EXISTS venda_produto (
    venda_id INTEGER NOT NULL REFERENCES venda(id) ON DELETE CASCADE,
    produto_id INTEGER NOT NULL REFERENCES produto(id) ON DELETE RESTRICT,
    preco NUMERIC(10,2) NOT NULL,
    quantidade INTEGER NOT NULL,
    PRIMARY KEY (venda_id, produto_id)
);

-- =============================================================================
-- DADOS INICIAIS (SEED)
-- =============================================================================

-- Usuário Administrador (admin / admin123) e Cliente de Teste (cliente / cliente123)
INSERT INTO usuario (nome, endereco, email, login, senha, administrador) 
VALUES 
    ('Administrador Crochê', 'Rua Central, 100', 'admin@crochemania.com.br', 'admin', 'admin123', TRUE),
    ('Maria Crocheteira', 'Av. das Linhas, 42 - Centro', 'maria@exemplo.com', 'cliente', 'cliente123', FALSE)
ON CONFLICT (login) DO NOTHING;

-- Categorias de Peças de Crochê
INSERT INTO categoria (descricao) 
VALUES 
    ('Amigurumi'),
    ('Chaveiros'),
    ('Acessórios'),
    ('Roupas'),
    ('Bolsas')
ON CONFLICT DO NOTHING;

-- Produtos Demonstrativos
INSERT INTO produto (descricao, preco, foto, quantidade, categoria_id)
VALUES 
    ('Polvo do Humor Amigurumi', 45.00, '/img/amigurumi.svg', 10, 1),
    ('Chaveiro Coração Crochê', 15.00, '/img/chaveiros.svg', 25, 2),
    ('Scrunchie de Crochê Seda', 18.00, '/img/acessorios.svg', 15, 3),
    ('Top Cropped Colorido', 85.00, '/img/roupas.svg', 8, 4),
    ('Bolsa de Praia em Fio de Malha', 120.00, '/img/bolsas.svg', 5, 5);
