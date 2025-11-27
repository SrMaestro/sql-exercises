create database if not exists e_commerce;

create table produtos (
id int primary key auto_increment,
nome varchar(255) not null,
preco decimal,
descricao varchar(255),
data_criacao datetime
);

INSERT INTO produtos (nome, preco, descricao, data_criacao)
VALUES
("teclado", 200, "gamer", '2025-11-26 14:30:00'),
("mouse", 150, "gamer", '2025-11-26 14:30:00'),
("monitor", 800, "gamer", '2025-11-26 14:30:00'),
("mousepad", 100, "gamer", '2025-11-26 14:30:00'),
("gabinete", 400, "gamer", '2025-11-26 14:30:00'),
("luminaria", 50, "gamer", '2025-11-26 14:30:00'),
("vassoura", 50, "gamer", '2025-11-26 14:30:00'),
("pre-treino", 300, "gamer", '2025-11-26 14:30:00');

SELECT * 
FROM produtos
WHERE preco > 500;

SELECT * 
FROM produtos
WHERE preco < 500;

UPDATE produtos
SET descricao = "para varrer"
WHERE nome = 'vassoura';


