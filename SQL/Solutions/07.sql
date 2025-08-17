-- Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD

WITH hded AS(
  SELECT hd, COUNT(*) AS count_hd FROM pc
  GROUP BY hd
)
SELECT hd FROM hded
WHERE count_hd >=2
