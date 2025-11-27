-- 1) Criar o banco de dados e selecionar
CREATE DATABASE IF NOT EXISTS db_generation_game_online;
USE db_generation_game_online;

-- 2) Criar tabela tb_classes
CREATE TABLE tb_classes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(255),
  tipo VARCHAR(50) -- ex: corpo-a-corpo, a-distancia, suporte
);

-- 3) Criar tabela tb_personagens
CREATE TABLE tb_personagens (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(120) NOT NULL,
  nivel INT NOT NULL DEFAULT 1,
  ataque INT NOT NULL DEFAULT 0,
  defesa INT NOT NULL DEFAULT 0,
  classe_id INT NOT NULL,
  FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

-- 4) Inserir 5 registros em tb_classes
INSERT INTO tb_classes (nome, descricao, tipo) VALUES
('Guerreiro', 'Classe corpo-a-corpo com alto HP e dano moderado', 'corpo-a-corpo'),
('Arqueiro',  'Especialista em ataques à distância, alto dano por acerto', 'a-distancia'),
('Mago',      'Usuário de magias com alto dano mágico e baixo HP', 'a-distancia'),
('Paladino',  'Suporte/tanque: cura moderada e boa defesa', 'suporte'),
('Assassino', 'Alta mobilidade e alto dano em ataques críticos', 'corpo-a-corpo');

-- 5) Inserir 8 registros em tb_personagens
INSERT INTO tb_personagens (nome, nivel, ataque, defesa, classe_id) VALUES
('Carlos, o Forte',          10, 2200, 1500, 1),
('Catarina, Flecha Veloz',    8, 1900, 1200, 2),
('Lúcio, o Arcanista',        12, 2500, 800,  3),
('Marta, Guardiã',            9,  1500, 1800, 4),
('Caelum, Sombrio',           11, 2300, 900,  5),
('Bruno, o Rústico',          5,  800,  1100, 1),
('Clara, a Vigia',            7,  1050, 1300, 2),
('Dante, o Errante',          13, 2700, 2100, 1);

-- 6) SELECT: personagens com ataque > 2000
SELECT id, nome, nivel, ataque, defesa, classe_id
FROM tb_personagens
WHERE ataque > 2000;

-- 7) SELECT: defesa entre 1000 e 2000
SELECT id, nome, nivel, ataque, defesa, classe_id
FROM tb_personagens
WHERE defesa BETWEEN 1000 AND 2000;

-- 8) SELECT com LIKE: nome contendo 'C' ou 'c'
SELECT id, nome, nivel, ataque, defesa, classe_id
FROM tb_personagens
WHERE nome LIKE '%C%' OR nome LIKE '%c%';

-- 9) INNER JOIN mostrando dados combinados
SELECT 
    p.id AS personagem_id,
    p.nome AS personagem_nome,
    p.nivel,
    p.ataque,
    p.defesa,
    c.id AS classe_id,
    c.nome AS classe_nome,
    c.tipo,
    c.descricao
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id;

-- 10) INNER JOIN filtrando por uma classe (ex: Arqueiro)
SELECT 
    p.id AS personagem_id,
    p.nome AS personagem_nome,
    p.nivel,
    p.ataque,
    p.defesa,
    c.nome AS classe_nome
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
WHERE c.nome = 'Arqueiro';
