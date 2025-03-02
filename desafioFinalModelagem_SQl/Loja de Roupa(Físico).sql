CREATE TABLE Produto (
    Nome VARCHAR(255),
    Codigo_do_Produto INTEGER PRIMARY KEY,
    Estoque INTEGER,
    Categoria VARCHAR(255),
    Codigo_do_Fabricante INTEGER,
    fk_Categoria_Codigo_de_Categoria INTEGER,
    UNIQUE (Codigo_do_Fabricante, fk_Categoria_Codigo_de_Categoria)
);

CREATE TABLE Fabricante (
    Nome VARCHAR(255),
    Numero_de_telefone VARCHAR(15),
    Codigo_do_fabricante INTEGER PRIMARY KEY,
    CNPJ VARCHAR(14),
    Endereco VARCHAR(255)
);

CREATE TABLE Loja (
    Codigo_da_Loja INTEGER PRIMARY KEY,
    Endereco VARCHAR(255),
    Nome VARCHAR(255),
    CNPJ VARCHAR(14)
);

CREATE TABLE Cliente (
    Numero_de_telefone VARCHAR(15),
    E_mail VARCHAR(255),
    Nome VARCHAR(255),
    Codigo_do_Cliente INTEGER PRIMARY KEY,
    CPF VARCHAR(14)
);

CREATE TABLE Vendedor (
    Numero_de_telefone VARCHAR(15),
    Codigo_do_Vendedor INTEGER PRIMARY KEY,
    E_mail VARCHAR(255),
    Nome VARCHAR(255),
    CPF VARCHAR(14)
);

CREATE TABLE Pedido (
    Codigo_do_Vendedor INTEGER,
    Data_do_Pedido DATE,
    Codigo_do_Cliente INTEGER,
    Codigo_do_Pedido INTEGER PRIMARY KEY,
    Valor_total FLOAT,
    UNIQUE (Codigo_do_Cliente, Codigo_do_Vendedor),
    FOREIGN KEY (Codigo_do_Vendedor) REFERENCES Vendedor (Codigo_do_Vendedor),
    FOREIGN KEY (Codigo_do_Cliente) REFERENCES Cliente (Codigo_do_Cliente)
);

CREATE TABLE Categoria (
    Nome VARCHAR(255),
    Codigo_de_Categoria INTEGER PRIMARY KEY
);

CREATE TABLE Fabrica (
    fk_Produto_Codigo_do_Produto INTEGER,
    fk_Produto_Codigo_do_Fabricante INTEGER,
    fk_Fabricante_Codigo_do_fabricante INTEGER,
    FOREIGN KEY (fk_Produto_Codigo_do_Produto) REFERENCES Produto (Codigo_do_Produto),
    FOREIGN KEY (fk_Produto_Codigo_do_Fabricante) REFERENCES Produto (Codigo_do_Fabricante),
    FOREIGN KEY (fk_Fabricante_Codigo_do_fabricante) REFERENCES Fabricante (Codigo_do_fabricante)
);

CREATE TABLE Realiza (
    fk_Pedido_Codigo_do_Vendedor INTEGER,
    fk_Pedido_Codigo_do_Cliente INTEGER,
    fk_Pedido_Codigo_do_Pedido INTEGER,
    fk_Cliente_Codigo_do_Cliente INTEGER,
    FOREIGN KEY (fk_Pedido_Codigo_do_Pedido) REFERENCES Pedido (Codigo_do_Pedido),
    FOREIGN KEY (fk_Cliente_Codigo_do_Cliente) REFERENCES Cliente (Codigo_do_Cliente) ON DELETE SET NULL
);

CREATE TABLE Atende (
    fk_Pedido_Codigo_do_Vendedor INTEGER,
    fk_Pedido_Codigo_do_Cliente INTEGER,
    fk_Pedido_Codigo_do_Pedido INTEGER,
    fk_Vendedor_Codigo_do_Vendedor INTEGER,
    FOREIGN KEY (fk_Pedido_Codigo_do_Pedido) REFERENCES Pedido (Codigo_do_Pedido),
    FOREIGN KEY (fk_Vendedor_Codigo_do_Vendedor) REFERENCES Vendedor (Codigo_do_Vendedor) ON DELETE SET NULL
);

CREATE TABLE Contrata (
    fk_Loja_Codigo_da_Loja INTEGER,
    fk_Vendedor_Codigo_do_Vendedor INTEGER,
    FOREIGN KEY (fk_Loja_Codigo_da_Loja) REFERENCES Loja (Codigo_da_Loja) ON DELETE RESTRICT,
    FOREIGN KEY (fk_Vendedor_Codigo_do_Vendedor) REFERENCES Vendedor (Codigo_do_Vendedor) ON DELETE RESTRICT
);

CREATE TABLE Contem (
    fk_Pedido_Codigo_do_Vendedor INTEGER,
    fk_Pedido_Codigo_do_Cliente INTEGER,
    fk_Pedido_Codigo_do_Pedido INTEGER,
    fk_Produto_Codigo_do_Produto INTEGER,
    fk_Produto_Codigo_do_Fabricante INTEGER,
    FOREIGN KEY (fk_Pedido_Codigo_do_Pedido) REFERENCES Pedido (Codigo_do_Pedido),
    FOREIGN KEY (fk_Produto_Codigo_do_Produto) REFERENCES Produto (Codigo_do_Produto) ON DELETE SET NULL
);

ALTER TABLE Produto ADD CONSTRAINT FK_Produto_2
    FOREIGN KEY (fk_Categoria_Codigo_de_Categoria)
    REFERENCES Categoria (Codigo_de_Categoria) ON DELETE RESTRICT;

INSERT INTO Categoria (Nome, Codigo_de_Categoria) VALUES 
('Camisetas', 1), 
('Calças', 2), 
('Tênis', 3), 
('Acessórios', 4), 
('Casacos', 5), 
('Moletons', 6), 
('Bermudas', 7), 
('Vestidos', 8), 
('Meias', 9), 
('Bonés', 10);

INSERT INTO Fabricante VALUES 
('Nike', '11987654321', 1, '12345678901234', 'São Paulo'),
('Adidas', '11876543210', 2, '56789012345678', 'Rio de Janeiro'),
('Puma', '11333445566', 3, '98765432101234', 'Belo Horizonte'),
('Fila', '11911223344', 4, '54321098765432', 'Curitiba'),
('Reebok', '11922334455', 5, '11223344556677', 'Porto Alegre'),
('Under Armour', '11777788899', 6, '99887766554433', 'Brasília');

INSERT INTO Produto VALUES 
('Camiseta Preta', 101, 50, 'Camisetas', 1, 1),
('Tênis Branco', 102, 30, 'Tênis', 2, 3),
('Moletom Azul', 103, 20, 'Moletons', 3, 6),
('Boné Vermelho', 104, 15, 'Bonés', 4, 10),
('Calça Jeans', 105, 25, 'Calças', 1, 2),
('Bermuda Azul', 106, 18, 'Bermudas', 2, 7),
('Vestido Floral', 107, 12, 'Vestidos', 3, 8),
('Meia Branca', 108, 40, 'Meias', 4, 9);

INSERT INTO Loja VALUES 
(1, 'Rua das Flores, 123', 'Loja Central', '12345678901234'),
(2, 'Avenida Paulista, 456', 'Loja Paulista', '23456789012345'),
(3, 'Rua da Praia, 789', 'Loja Praia', '34567890123456'),
(4, 'Avenida Brasil, 101', 'Loja Brasil', '45678901234567'),
(5, 'Rua das Palmeiras, 202', 'Loja Palmeiras', '56789012345678'),
(6, 'Avenida Copacabana, 303', 'Loja Copacabana', '67890123456789'),
(7, 'Rua das Oliveiras, 404', 'Loja Oliveiras', '78901234567890'),
(8, 'Avenida Ipiranga, 505', 'Loja Ipiranga', '89012345678901');

INSERT INTO Cliente VALUES 
('11999998888', 'cliente1@email.com', 'João Silva', 1, '11122233344'),
('11988887777', 'cliente2@email.com', 'Maria Oliveira', 2, '22233344455'),
('11977776666', 'cliente3@email.com', 'Carlos Souza', 3, '33344455566'),
('11966665555', 'cliente4@email.com', 'Ana Costa', 4, '44455566677'),
('11955554444', 'cliente5@email.com', 'Pedro Lima', 5, '55566677788'),
('11944443333', 'cliente6@email.com', 'Fernanda Rocha', 6, '66677788899'),
('11933332222', 'cliente7@email.com', 'Ricardo Almeida', 7, '77788899900'),
('11922221111', 'cliente8@email.com', 'Juliana Pereira', 8, '88899900011');

INSERT INTO Vendedor VALUES 
('11911112222', 1, 'vendedor1@email.com', 'Lucas Mendes', '99988877766'),
('11922223333', 2, 'vendedor2@email.com', 'Patricia Santos', '88877766655'),
('11933334444', 3, 'vendedor3@email.com', 'Roberto Fernandes', '77766655544'),
('11944445555', 4, 'vendedor4@email.com', 'Camila Alves', '66655544433'),
('11955556666', 5, 'vendedor5@email.com', 'Gustavo Oliveira', '55544433322'),
('11966667777', 6, 'vendedor6@email.com', 'Mariana Costa', '44433322211'),
('11977778888', 7, 'vendedor7@email.com', 'Felipe Rocha', '33322211100'),
('11988889999', 8, 'vendedor8@email.com', 'Isabela Lima', '22211100099');

INSERT INTO Pedido VALUES 
(1, '2023-10-01', 1, 1001, 150.00),
(2, '2023-10-02', 2, 1002, 200.00),
(3, '2023-10-03', 3, 1003, 300.00),
(4, '2023-10-04', 4, 1004, 250.00),
(5, '2023-10-05', 5, 1005, 180.00),
(6, '2023-10-06', 6, 1006, 220.00),
(7, '2023-10-07', 7, 1007, 190.00),
(8, '2023-10-08', 8, 1008, 210.00);

INSERT INTO Fabrica VALUES 
(101, 1, 1),
(102, 2, 2),
(103, 3, 3),
(104, 4, 4),
(105, 1, 1),
(106, 2, 2),
(107, 3, 3),
(108, 4, 4);

INSERT INTO Realiza VALUES 
(1, 1, 1001, 1),
(2, 2, 1002, 2),
(3, 3, 1003, 3),
(4, 4, 1004, 4),
(5, 5, 1005, 5),
(6, 6, 1006, 6),
(7, 7, 1007, 7),
(8, 8, 1008, 8);

INSERT INTO Atende VALUES 
(1, 1, 1001, 1),
(2, 2, 1002, 2),
(3, 3, 1003, 3),
(4, 4, 1004, 4),
(5, 5, 1005, 5),
(6, 6, 1006, 6),
(7, 7, 1007, 7),
(8, 8, 1008, 8);

INSERT INTO Contrata VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

INSERT INTO Contem VALUES 
(1, 1, 1001, 101, 1),
(2, 2, 1002, 102, 2),
(3, 3, 1003, 103, 3),
(4, 4, 1004, 104, 4),
(5, 5, 1005, 105, 1),
(6, 6, 1006, 106, 2),
(7, 7, 1007, 107, 3),
(8, 8, 1008, 108, 4);

SELECT Codigo_do_Cliente, COUNT(Codigo_do_Pedido) AS total_pedidos
FROM Pedido
GROUP BY Codigo_do_Cliente;
#Aqui Podemos ver o codigo do cliente e contar o total de pedidos e todos os codigos deram 1 total de pedidos

SELECT p.Nome AS nome_produto, f.Nome AS nome_fabricante
FROM Produto p
JOIN Fabricante f ON p.Codigo_do_Fabricante = f.Codigo_do_fabricante;
#Aqui vemos nome do produto e nome da fabricante, é possível verificar quais fabricantes produzem quais produtos

SELECT pe.Codigo_do_Pedido, c.Nome AS nome_cliente, v.Nome AS nome_vendedor, pe.Valor_total
FROM Pedido pe
JOIN Cliente c ON pe.Codigo_do_Cliente = c.Codigo_do_Cliente
JOIN Vendedor v ON pe.Codigo_do_Vendedor = v.Codigo_do_Vendedor;
#Ja aqui temos o codigo do cliente, nome do cliente, nome do vendedor e o valor do produto, é possível analisar os pedidos realizados, identificar quais vendedores são responsáveis por quais clientes e obter insights sobre as vendas