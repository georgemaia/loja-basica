CREATE TABLE `pedido` (
  `id` integer PRIMARY KEY,
  `cliente_id` integer,
  `endereco_id` integer,
  `status` varchar(255),
  `frete` float,
  `data_compra` datetime
);

CREATE TABLE `pedido_produtos` (
  `id` integer PRIMARY KEY,
  `pedido_id` integer,
  `produto_id` integer,
  `quantidade` integer
);

CREATE TABLE `cliente` (
  `id` integer PRIMARY KEY,
  `nome` varchar(255),
  `cpf_cnpj` varchar(255),
  `email` varchar(255),
  `telefone` varchar(255)
);

CREATE TABLE `cliente_endereco` (
  `id` integer PRIMARY KEY,
  `cliente_id` integer,
  `cep` varchar(255),
  `endereco` varchar(255),
  `cidade` varchar(255),
  `estado` varchar(255)
);

CREATE TABLE `produto` (
  `id` integer PRIMARY KEY,
  `fornecedor_id` integer,
  `produto` varchar(255),
  `estoque` integer,
  `preco` float
);

CREATE TABLE `fornecedor` (
  `id` integer PRIMARY KEY,
  `nome` varchar(255),
  `email` varchar(255),
  `telefone` varchar(255)
);

ALTER TABLE `cliente_endereco` ADD FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

ALTER TABLE `pedido` ADD FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

ALTER TABLE `fornecedor` ADD FOREIGN KEY (`id`) REFERENCES `produto` (`id`);

ALTER TABLE `cliente_endereco` ADD FOREIGN KEY (`id`) REFERENCES `pedido` (`endereco_id`);

ALTER TABLE `pedido` ADD FOREIGN KEY (`id`) REFERENCES `pedido_produtos` (`pedido_id`);

ALTER TABLE `produto` ADD FOREIGN KEY (`id`) REFERENCES `pedido_produtos` (`produto_id`);
