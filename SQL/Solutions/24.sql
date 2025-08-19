-- Найдите страны, имевшие когда-либо классы обычных боевых кораблей ('bb') и имевшие когда-либо классы крейсеров ('bc').

SELECT country FROM classes
WHERE type = 'bc'
AND country IN (
              SELECT country FROM classes
              WHERE type = 'bb'
              GROUP BY country
              HAVING COUNT(type) > 0
)
GROUP BY country
HAVING COUNT(type) > 0
