use lojaads;

select cpf, nome, nascimento, sexo,
	if (salario >= 5000, 'Ouro', 'Especial') as classificacao
from clientes;

select cpf, nome,
	   CASE
			WHEN sexo = 'F' THEN 'FEMININO'
            WHEN sexo = 'M' THEN 'MASCULINO'
            ELSE 'NÃO INFORMADO'
		END AS sexo_ext
FROM clientes
order by sexo;

select count(*) as qtd 
from clientes;

select count(salario) as qtd 
from clientes;

select sum(salario) as qtd 
from vendedores
where sexo = 'F';

select avg(salario) as mediasalario
from vendedores
where sexo = 'F';

select avg(preco)
from produtos;

select max(salario)
from clientes
where uf = 'mg';

select min(preco) as menorpreco
from produtos
where nome = 'XBOX ONE' or nome = 'PLAYSTATION 5';

select avg(salario) as mediasalarial, floor(avg(salario)) as parabaixo,
	   ceil(avg(salario)) as paracima, round(avg(salario), 2) as duascasas
from vendedores;


select count(sexo) as sexo
from clientes
where sexo = 'M';

select count(sexo) as sexo
from clientes
where sexo = 'F';

select count(salario) as qtd
from vendedores
where salario >= '5000' or salario <= '8000';

select count(validade) as validade
from produtos
where validade <= now();

select count(data) as qtd
from compras
where year(data) = year(now());

select sum(salario) as qtd, round(avg(salario), 2) as salario_medio 
from vendedores
where now() between nascimento + interval 30 year and nascimento + interval 45 year;

select ceil(avg(preco)) as preco_acima, floor(avg(preco)) as preco_abaixo
from produtos
where nome like '%cel%';



