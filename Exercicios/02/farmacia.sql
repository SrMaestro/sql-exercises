-- 1) Criar o banco de dados e selecionar
CREATE DATABASE IF NOT EXISTS db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

-- 2) Criar tabela tb_categorias
CREATE TABLE tb_categorias (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(120) NOT NULL,
  descricao VARCHAR(255) NOT NULL
);

-- 3) Criar tabela tb_produtos
CREATE TABLE tb_produtos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(120) NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  estoque INT NOT NULL DEFAULT 0,
  fabricante VARCHAR(120),
  categoria_id INT NOT NULL,
  FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- 4) Inserir 5 registros na tabela tb_categorias
INSERT INTO tb_categorias (nome, descricao) VALUES
('Medicamentos', 'Produtos destinados a tratamentos de saúde'),
('Higiene', 'Produtos de cuidados pessoais e limpeza'),
('Cosméticos', 'Produtos de beleza e uso estético'),
('Vitaminas', 'Suplementos vitamínicos e nutricionais'),
('Primeiros Socorros', 'Produtos emergenciais de saúde');

-- 5) Inserir 8 registros na tabela tb_produtos
INSERT INTO tb_produtos (nome, preco, estoque, fabricante, categoria_id) VALUES
('Paracetamol 750mg',       12.50, 100, 'MedLife',            1),
('Ibuprofeno 400mg',        18.90, 80,  'SaúdeForte',         1),
('Shampoo Anticaspa',       32.00, 50,  'ClearCare',          2),
('Creme Hidratante Facial', 58.90, 40,  'BelezaPura',         3),
('Vitamina C 500mg',        35.00, 60,  'NutriPlus',          4),
('Curativo Estéril',        6.50,  200, 'MediSafe',           5),
('Protetor Solar FPS 50',   72.00, 30,  'SunBlock',           3),
('Sabonete Líquido Neutro', 15.00, 120, 'SoftClean',          2);

-- 6) SELECT: produtos com preço > 50
SELECT * 
FROM tb_produtos
WHERE preco > 50;

-- 7) SELECT: produtos com preço entre 5 e 60
SELECT *
FROM tb_produtos
WHERE preco BETWEEN 5 AND 60;

-- 8) SELECT com LIKE: produtos que possuem a letra 'C' ou 'c' no nome
SELECT *
FROM tb_produtos
WHERE nome LIKE '%C%' OR nome LIKE '%c%';

-- 9) INNER JOIN: unir produtos com categorias
SELECT 
    p.id AS produto_id,
    p.nome AS produto_nome,
    p.preco,
    p.estoque,
    p.fabricante,
    c.nome AS categoria_nome,
    c.descricao AS categoria_descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- 10) INNER JOIN filtrando por categoria específica (ex: cosméticos)
SELECT 
    p.id AS produto_id,
    p.nome AS produto_nome,
    p.preco,
    p.fabricante,
    c.nome AS categoria_nome
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Cosméticos';
