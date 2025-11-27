-- 1) Criar o banco de dados
CREATE DATABASE db_pizzaria_legal;

-- 2) Selecionar o banco
USE db_pizzaria_legal;

-- 3) Criar tabela tb_categorias
CREATE TABLE tb_categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

-- 4) Criar tabela tb_pizzas
CREATE TABLE tb_pizzas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    tamanho ENUM('P','M','G') NOT NULL,
    valor DECIMAL(6,2) NOT NULL,
    borda_recheada BOOLEAN NOT NULL DEFAULT 0,
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- 5) Inserir 5 registros em tb_categorias
INSERT INTO tb_categorias (nome, descricao) VALUES
('Tradicional', 'Pizzas salgadas tradicionais da casa'),
('Especial', 'Pizzas com ingredientes selecionados e premium'),
('Doce', 'Pizzas doces e sobremesas'),
('Vegetariana', 'Pizzas feitas sem carne'),
('Vegana', 'Pizzas preparadas sem ingredientes de origem animal');

-- 6) Inserir 8 registros em tb_pizzas
INSERT INTO tb_pizzas (nome, tamanho, valor, borda_recheada, categoria_id) VALUES
('Mussarela', 'M', 38.00, 0, 1),
('Calabresa', 'G', 49.90, 1, 1),
('Frango com Catupiry', 'G', 55.00, 1, 2),
('Chocolate ao Leite', 'M', 42.50, 0, 3),
('Prestígio', 'G', 60.00, 0, 3),
('Marguerita', 'M', 48.00, 0, 4),
('Vegana Verde', 'G', 72.00, 1, 5),
('Portuguesa Especial', 'G', 65.00, 1, 2);

-- 7) SELECT pizzas com valor > 45,00
SELECT * FROM tb_pizzas
WHERE valor > 45.00;

-- 8) SELECT pizzas com valor entre 50 e 100
SELECT * FROM tb_pizzas
WHERE valor BETWEEN 50.00 AND 100.00;

-- 9) SELECT com LIKE buscando pizzas com letra 'M'
SELECT * FROM tb_pizzas
WHERE nome LIKE '%M%';

-- 10) SELECT com INNER JOIN (trazendo todas as pizzas e suas categorias)
SELECT p.id, p.nome, p.valor, c.nome AS categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c
ON p.categoria_id = c.id;

-- 11) SELECT com INNER JOIN trazendo apenas pizzas de uma categoria específica (ex: doces)
SELECT p.id, p.nome, p.valor, c.nome AS categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c
ON p.categoria_id = c.id
WHERE c.nome = 'Doce';
