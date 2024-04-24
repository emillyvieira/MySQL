use lojaads;

SELECT nome, nascimento
FROM clientes
WHERE nascimento BETWEEN '2000-01-01' AND '2000-12-31'
order by nascimento desc;

SELECT registro, nome, salario, comissao
FROM vendedores
WHERE salario BETWEEN 1000 AND 3000
order by salario desc;

select *
from clientes
where nome like "V__e%";

select *
from clientes
where nascimento like "__7_-02-__";

select *
from compras
where status not like '%\%%';


select nome, day(nascimento) as dia,
			month(nascimento) as mes,
            year(nascimento) as ano
from clientes
where year(nascimento) = 2000;

select nome, concat(day(nascimento), '/',
			month(nascimento), '/',
            year(nascimento)) as nascimento
from clientes
where year(nascimento) = 2000;

select HOUR(hora) as hora,
			minute(hora) as minuto,
            second(hora) as segundo
from compras;

select NOW(), sleep(5), NOW();
select NOW(), sleep(5), SYSDATE();

SELECT nascimento, nascimento + interval 10 day from clientes;

select hora, hora + interval 25 minute from compras;

select data, datediff(now(), data)
from compras;

select nascimento, TIMESTAMPDIFF(year, nascimento, now()) as anos,
				   TIMESTAMPDIFF(month, nascimento, now()) as meses,
                   TIMESTAMPDIFF(day, nascimento, now()) as dias,
                   TIMESTAMPDIFF(hour, nascimento, now()) as horas,
                   TIMESTAMPDIFF(minute, nascimento, now()) as minutos,
                   TIMESTAMPDIFF(second, nascimento, now()) as segundos,
                   TIMESTAMPDIFF(microsecond, nascimento, now()) as microsegundos
from clientes;

/*Exiba uma lista com código dos produtos que já foram vendidos na loja sem repetições*/
select distinct numero from compras;

/*Precisamos de uma lista dos aniversariantes do mês que vem, essa lista precisa ser gerada todo mês*/
select nome, nascimento
from clientes
where month(nascimento) = month(now() + interval 1 month)
order by nascimento desc;

select nome, nascimento
from clientes
where month(nascimento) = month(now() + interval 1 month)
order by nascimento desc;

select nome, nascimento
from clientes;

/*Precisamos da lista de produtos que irão vencer entre os meses 07 e 10 de 2044*/
select nome, validade
from produtos
where validade between "2044-07-01" and "2044-10-31"
order by validade desc;

/*Precisamos saber se existem e quais são os clientes que moram no endereço que começa com três dígitos numéricos seguido do texto ‘Kings’ e com uma letra ‘p’ na sequência em qualquer lugar*/
select endereco
from clientes
where endereco like '____Kings%p%'
order by nome desc;


/*Exiba uma lista com código e cpf das vendas realizadas há no máximo 3 meses.*/
select codigo, cpf, data
from compras
where data >= now() - interval 3 month
order by data desc;

/*Exiba uma lista com código e cpf das vendas realizadas há pelo menos 3 meses que não foram canceladas ou devolvidas.*/
select codigo, cpf, data, status
from compras
where data >= now() - interval 3 month and (status != "canceladas" or status != "devolvidas")
order by data desc;

/*Exiba uma lista com código, cpf e a quantidade de produtos das vendas
realizadas há pelo menos um ano, entre 14:00 e 18:00 horas e que
possuem o caractere ‘%’ no campo status.*/
select codigo, cpf, data, hora, status
from compras
where 
	data >= now() - interval 1 year and 
	hora between '14:00:00' and 
	'18:00:00' and status like '%\%%'
order by hora desc;

select numero, cpf, status
from compras
where data >= now() - interval 1 year and hora between '06:00:00' and '12:00:00'
order by data desc;

select nome, nascimento
from vendedores
where nascimento <= now() - interval 40 year
order by nascimento asc;


