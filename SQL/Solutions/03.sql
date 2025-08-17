-- Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.

SELECT DISTINCT p.maker, l.speed FROM Product p
JOIN Laptop l
    ON p.model = l.model
WHERE l.hd >= 10
