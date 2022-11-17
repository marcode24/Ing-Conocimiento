# Clase 17-11-2022

### Ejercicio

escribir una consular de las tablas de balances y embarque que agrupe por mercado y por insumo el valor de los inventarios de las empresas de la industria **5** idempresa=empresa

```sql
SELECT industria, mercado, idalmacen, SUM(precio) as total
FROM balances b
RIGHT JOIN embarque e
ON b.empresa = e.idempresa
WHERE industria = 5
GROUP BY mercado, idalmacen;
```

```sql

SELECT industria, mercado, COUNT(*) / (SELECT COUNT(*) from embarque) AS probabilidad
FROM balances b
RIGHT JOIN embarque e
ON b.empresa = e.idempresa
WHERE e.precio > 2000
GROUP BY mercado;

```
