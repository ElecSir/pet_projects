-- Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price

SELECT  maker, price FROM printer
JOIN product p
  ON printer.model = p.model
WHERE price = (
          SELECT MIN(price) 
          FROM printer 
          WHERE color = 'y'
          )
AND color = 'y'
