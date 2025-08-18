-- Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.

SELECT maker, AVG(hd) AS Avg_hd FROM product
JOIN pc ON product.model = pc.model
WHERE maker IN (
              SELECT product.maker FROM product
              JOIN printer ON product.model = printer.model
              )
GROUP BY maker
