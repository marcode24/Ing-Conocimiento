# Scripts de SQL

```sql
SELECT sum(Probabilidad) as Probabilidad FROM conjuntas WHERE mercado = 1;

SELECT mercado, count(*) / (SELECT count(*) FROM balances) as conjunta FROM balances WHERE mercado IN (SELECT DISTINCT mercado FROM balances) GROUP BY mercado;

SELECT mercado, industria, count(*) / (SELECT count(*) FROM balances) AS conjunta FROM balances
  WHERE mercado IN (SELECT DISTINCT mercado FROM balances) GROUP BY mercado, industria;

SELECT mercado, industria, producto, count(*) / (SELECT count(*) FROM pedido) AS conjunta_pedido FROM pedido
  GROUP BY mercado, industria, producto;


SELECT count(*) FROM balances;
```
