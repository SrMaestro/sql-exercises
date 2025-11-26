-- Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema trabalhará com as informações dos colaboradores desta empresa. 

CREATE DATABASE IF NOT EXISTS DB_quitanda;
USE DB_quitanda;


-- Crie uma tabela de colaboradores e determine 5 atributos relevantes dos colaboradores para se trabalhar com o serviço deste R
CREATE TABLE colaboradores (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  cargo VARCHAR(255),
  salario DECIMAL(10,2)
);

-- Insira nesta tabela no mínimo 5 dados (registros).
INSERT INTO colaboradores (id,nome, email, cargo, salario)
VALUES 
(1, 'João Silva', 'joao.silva@empresa.com', 'Analista de Sistemas', 5500.00),
(2, 'Ana', 'Ana@empresa.com', 'Analista de Sistemas', 5500.00),
(3, 'Bob', 'Bob@empresa.com', 'Analista de Sistemas', 4500.00),
(4, 'Luis', 'Luis@empresa.com', 'Analista de Sistemas', 3500.00),
(5, 'Lucas', 'Lucas@empresa.com', 'Analista de Sistemas', 2500.00);



-- Faça um SELECT que retorne todes os colaboradores com o salário maior do que 2000.
SELECT * 
FROM colaboradores
WHERE SALARio > 2000;

-- Faça um SELECT que retorne todes os colaboradores com o salário menor do que 2000.
SELECT * 
FROM colaboradores
WHERE SALARio < 2000;

-- Ao término atualize um registro desta tabela através de uma query de atualização.
UPDATE colaboradores
SET salario = 5000.00
WHERE nome = 'Bob';




