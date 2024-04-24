use lojaads;

SELECT * FROM compras;
SELECT * FROM vendedores;
SELECT * FROM produtos;


SELECT * 
FROM clientes cl INNER JOIN compras co ON cl.cpf = co.cpf
WHERE co.data BETWEEN '2022-01-03' AND '2022-01-15'
		AND cl.sexo = 'F'
        order by data desc;
        
SELECT cl.cpf, cl.nome, cl.sexo, co.data, co.hora
FROM compras co
INNER JOIN clientes cl ON cl.cpf = co.cpf
WHERE co.codigo = 1850
ORDER BY co.data DESC;

SELECT ve.registro, ve.nome
FROM compras co
INNER JOIN vendedores ve ON ve.registro = co.registro
WHERE year(co.data) = 2024
ORDER BY co.data DESC;

SELECT pr.nome, co.quantidade * pr.preco AS valor_total
FROM produtos pr
INNER JOIN compras co ON co.numero = pr.numero
WHERE co.codigo = 2202
ORDER BY co.data DESC;


