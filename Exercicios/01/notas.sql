CREATE DATABASE escola_registro;
USE escola_registro;

CREATE TABLE estudantes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    idade INT,
    serie VARCHAR(10),
    nota DECIMAL(3,1),
    data_cadastro DATETIME
);

INSERT INTO estudantes (nome, idade, serie, nota, data_cadastro)
VALUES
("Ana Silva", 14, "8A", 8.5, NOW()),
("Bruno Santos", 13, "7B", 6.0, NOW()),
("Carla Souza", 15, "9A", 9.2, NOW()),
("Diego Costa", 14, "8A", 7.4, NOW()),
("Eduarda Lima", 12, "6C", 5.8, NOW()),
("Felipe Rocha", 16, "9B", 8.0, NOW()),
("Gabriela Alves", 13, "7A", 4.9, NOW()),
("Henrique Torres", 14, "8B", 9.0, NOW());

SELECT * FROM estudantes
WHERE nota > 7.0;

SELECT * FROM estudantes
WHERE nota < 7.0;

UPDATE estudantes
SET nota = 7.2
WHERE nome = "Eduarda Lima";
