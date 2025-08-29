CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE autores (
  id_autor INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  nacionalidade VARCHAR(50),
  ano_nascimento INT
);

CREATE TABLE livros (
  id_livro INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  genero VARCHAR(50),
  ano_publicacao INT CHECK (ano_publicacao > 1500 AND ano_publicacao <= YEAR(CURDATE())),
  id_autor int,
  FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

CREATE TABLE leitores (
  id_leitor INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  telefone VARCHAR(20)
);

CREATE TABLE emprestimos (
  id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
  id_livro INT,
  id_leitor INT,
  data_emprestimo DATE NOT NULL,
  data_devolucao DATE,
  FOREIGN KEY (id_livro) REFERENCES livros(id_livro),
  FOREIGN KEY (id_leitor) REFERENCES leitores(id_leitor),
  CHECK (data_devolucao IS NULL OR data_devolucao >= data_emprestimo)
);

insert into autores (nome, nacionalidade, ano_nascimento) values
('Machado de Assis', 'Brasileiro', 1839),
('José de Alencar', 'Brasileiro', 1829);

insert into livros (titulo, genero, ano_publicacao, id_autor) values
('Dom Casmurro', 'Romance', 1899, 1),
('O Guarani', 'Romance', 1857, 2);