/* Задание 1 */
DECLARE @a INT, @b INT, @c INT 
SET @a = 5  
SET @b = 10 
SET @c = @a + @b 
PRINT @c

/* Задание 2 */
WITH AverageScores AS (
    SELECT 
        Школа,
        AVG(Баллы) AS СреднийБалл
    FROM 
        Ученики
    WHERE 
        Школа IN ('Лицей', 'Гимназия') -- Фильтр по типу школ
    GROUP BY 
        Школа
)
SELECT 
    ABS(
        (SELECT СреднийБалл FROM AverageScores WHERE Школа = 'Лицей') -
        (SELECT СреднийБалл FROM AverageScores WHERE Школа = 'Гимназия')
    ) AS Разница
;

/* Задание 3 */
SELECT 
    CASE 
        WHEN COUNT(*) % 2 = 0 THEN 'Четное' 
        ELSE 'Нечетное' 
    END AS КоличествоСтрок
FROM Ученики;

/* Задание 4 */
DECLARE @Число INT = 1234;
DECLARE @Сумма INT = 0;

WHILE @Число > 0
BEGIN
    SET @Сумма = @Сумма + @Число % 10;
    SET @Число = @Число / 10;
END;

PRINT @Сумма

/* Задание 5 */
DECLARE @a INT = 5, @b INT = 10, @c INT = 15
DECLARE @min INT
SET @min = @a
IF @b < @min SET @min = @b
IF @c < @min SET @min = @c
PRINT @min

/* Задание 6 */
DECLARE @a INT = 33;
PRINT CASE WHEN @a % 11 = 0 THEN 'Делится' ELSE 'Не делится' END;

/* Задание 7 */
DECLARE @N INT = 27;
WHILE @N > 1 AND @N % 3 = 0
    SET @N = @N / 3;

PRINT CASE WHEN @N = 1 THEN 'Да' ELSE 'Нет' END;

/* Задание 8 */
DECLARE @a INT = rand() * 100, @b INT = rand() * 100;
DECLARE @НОК INT = (@a * @b) / (SELECT MAX(значение) FROM (VALUES (1), (@a % @b), (@b % @a)) AS x(значение));
PRINT @НОК;

/* Задание 9 */
DECLARE @A INT = 2, @B INT = 5;
DECLARE @Сумма INT = 0;

WITH Числа AS (
    SELECT @A AS Число
    UNION ALL
    SELECT Число + 1 FROM Числа WHERE Число < @B
)
SELECT SUM(Число * Число) AS СуммаКвадратов FROM Числа;

/* Задание 10 */
DECLARE @N INT = 1;

WHILE NOT (@N % 2 = 1 AND @N % 3 = 1 AND @N % 4 = 1 AND @N % 5 = 1 AND @N % 6 = 1 AND @N % 7 = 0)
    SET @N = @N + 1;

PRINT @N;

/* Задание 11 */
DECLARE @surname NVARCHAR(50) = 'Ислам'
DECLARE @length INT = LEN(@surname), @counter INT = 1
WHILE @counter <= @length
BEGIN
    PRINT @surname
    SET @counter = @counter + 1
END

/* Задание 12 */
DECLARE @text NVARCHAR(50) = 'Мухучкала'
DECLARE @i INT = 1
DECLARE @spaces NVARCHAR(50)
DECLARE @length INT = LEN(@text)

WHILE @i <= @length
BEGIN
    SET @spaces = REPLICATE(' ', @length - @i) -- Пробелы для симметрии
    PRINT @spaces + LEFT(@text, @i) + REVERSE(LEFT(@text, @i - 1)) -- Текст и его зеркальное отражение
    SET @i = @i + 1
END