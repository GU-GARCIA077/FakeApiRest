CREATE TABLE Cliente (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  numero_contato VARCHAR(15) NOT NULL,
  data_nascimento DATE NOT NULL
);

CREATE TABLE Produto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  tipo VARCHAR(50) NOT NULL,
  valor DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Pedido (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  data_pedido DATE NOT NULL,
  status ENUM('Concluído', 'Em Andamento', 'Cancelado') NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

CREATE TABLE PedidoProduto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  pedido_id INT NOT NULL,
  produto_id INT NOT NULL,
  quantidade INT NOT NULL,
  FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
  FOREIGN KEY (produto_id) REFERENCES Produto(id)
);

### INSERTS NAS TABELAS  cliente

INSERT INTO Cliente (nome, email, numero_contato,data_nascimento)
VALUES ('Gustavo Carvalho', 'gustavocarvalho.gc79@gmail.com','77999412711', '2001-02-02');

INSERT INTO Cliente (nome, email, numero_contato,data_nascimento)
VALUES ('Ariane Nona', 'arigabi2712@gmail.com','77999099263', '1984-12-27');

INSERT INTO Cliente (nome, email, numero_contato,data_nascimento)
VALUES ('Maria Alice', 'mariaalice1502@gmail.com','77999001506', '2023-06-15');

 ### insert na tabela produto 
 
insert into Produto (nome, tipo , valor) values ('celular xiaomi poco x5 pro','eletrônico', '2099.50');
insert into Produto (nome, tipo , valor) values ('fone de ouvido redmidots2','eletrônico', '159.90');
insert into Produto (nome, tipo , valor) values ('Mouse logitech sem fio','eletrônico', '298.77');
insert into Produto (nome, tipo , valor) values ('jaqueta de couro ','Vestuário', '250.39');
insert into Produto (nome, tipo , valor) values ('camisa social aramis ','Vestuário', '280.98');
insert into Produto (nome, tipo , valor) values (' boné ellus origins ','Vestuário', '120.45');
insert into Produto (nome, tipo , valor) values ('batata ruffles 300g ','Alimentos', '15.39');
insert into Produto (nome, tipo , valor) values (' salgadinho doritos  200g ','Alimentos', '17.80');
insert into Produto (nome, tipo , valor) values ('salgadinho fandangos de presunto ','Alimentos', '10.29');

###insert na tabela pedido 

INSERT INTO Pedido (cliente_id, data_pedido, status) VALUES (1, '2024-10-03', 'Em Andamento');
INSERT INTO Pedido (cliente_id, data_pedido, status) VALUES (2, '2024-10-03', 'Concluído');
INSERT INTO Pedido (cliente_id, data_pedido, status) VALUES (1, '2024-10-03', 'Cancelado');

### inserindo produtos no pedido 
INSERT INTO pedidoproduto (pedido_id, produto_id, quantidade)
VALUES (1, 1, 2), -- Produto 1, quantidade 2
(1, 2, 1); -- Produto 2, quantidade 1

INSERT INTO pedidoProduto (pedido_id, produto_id, quantidade) 
VALUES (2, 1, 5), -- Produto 1, quantidade 2
       (2, 5, 1); -- Produto 2, quantidade 1

INSERT INTO pedidoProduto (pedido_id, produto_id, quantidade) 
VALUES (3, 7,2 ), -- Produto 1, quantidade 2
       (3, 5, 2), -- Produto 5,quantidade 2
       (3,9,1)-- Produto 9, quantidade 1
       
       
###selects para consulta :

SELECT 
    p.id AS pedido_id,
    p.data_pedido,
    p.status,
    prod.nome AS nome_produto,
    prod.tipo AS tipo_produto,
    pp.quantidade
FROM 
    Pedido p
JOIN 
    pedidoproduto pp ON p.id = pp.pedido_id
JOIN 
    Produto prod ON pp.produto_id = prod.id;

