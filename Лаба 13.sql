CREATE TABLE Страны (
    [Name]  NVARCHAR(100),
    [Metropolis] NVARCHAR(100),
	[Area] INT,
    [Population] INT,
    [Continent] NVARCHAR(100)
);
INSERT Страны Values
('Австрия', 'Вена', '83858', '8741753', 'Европа'),
('Азербайджан', 'Баку', '86600', '9705600', 'Азия'),
('Албания', 'Тирана', '28748', '2866026', 'Европа'),
('Алжир', 'Алжир', '2381740', '39813722', 'Африка'),
('Ангола', 'Луанда', '1246700', '25831000', 'Африка'),
('Аргентина', 'Буэнос-Айрес', '2766890', '43847000', 'Южная Америка'),
('Афганистан', 'Кабул', '647500', '29822848', 'Азия'),
('Бангладеш', 'Дакка', '144000', '160221000', 'Азия'),
('Бахрейн', 'Манама', '701', '1397000', 'Азия'),
('Белиз', 'Бельмопан', '22966', '377968', 'Северная Америка'),
('Белоруссия', 'Минск', '207595', '9498400', 'Европа'),
('Бельгия', 'Брюссель', '30528', '11250585', 'Европа'),
('Бенин', 'Порто-Ново', '112620', '11167000', 'Африка'),
('Болгария', 'София', '110910', '7153784', 'Европа'),
('Боливия', 'Сукре', '1098580', '10985059', 'Южная Америка'),
('Ботсвана', 'Габороне', '600370', '2209208', 'Африка'),
('Бразилия', 'Бразилиа', '8511965', '206081432', 'Южная Америка'),
('Буркина-Фасо', 'Уагадугу', '274200', '19034397', 'Африка'),
('Бутан', 'Тхимпху', '47000', '784000', 'Азия'),
('Великобритания', 'Лондон', '244820', '65341183', 'Европа'),
('Венгрия', 'Будапешт', '93030', '9830485', 'Европа'),
('Венесуэла', 'Каракас', '912050', '31028637', 'Южная Америка'),
('Восточный Тимор', 'Дили', '14874', '1167242', 'Азия'),
('Вьетнам', 'Ханой', '329560', '91713300', 'Азия');

/* 1 */

CREATE PROCEDURE GetSystemInfo
AS
BEGIN
    -- Информация о сервере
    SELECT @@SERVERNAME AS ServerName;

    -- Информация о базе данных
    SELECT DB_NAME() AS DatabaseName;

    -- Информация о текущем пользователе
    SELECT SUSER_NAME() AS CurrentUser;

    -- Текущее время
    SELECT GETDATE() AS CurrentTime;
END

EXEC GetSystemInfo;

/* 2 */

CREATE PROCEDURE CountryFunc
AS
BEGIN
    SELECT [Name], [Metropolis], [Continent]
    FROM Страны;
END

EXEC CountryFunc;

/* 3 */

CREATE PROCEDURE хранфункц
    @excluded_continent NVARCHAR(100)
AS
BEGIN
    SELECT [Name]
    FROM Страны
    WHERE [Continent] <> @excluded_continent;
END;

EXEC хранфункц @excluded_continent = N'Европа';

/* 4 */

CREATE PROCEDURE CountriesByPopulationRange
    @MinPopulation INT,
    @MaxPopulation INT
AS
BEGIN
    SELECT 
        [Name] AS 'Страна', 
        [Population] AS 'Население', 
        [Metropolis] AS 'Столица', 
        [Continent] AS 'Континент'
    FROM 
        Страны
    WHERE 
        [Population] BETWEEN @MinPopulation AND @MaxPopulation;
END;

-- Вызов процедуры с примерным диапазоном населения
EXEC CountriesByPopulationRange @MinPopulation = 10000000, @MaxPopulation = 50000000;

/* 5 */

CREATE PROCEDURE CountCountriesWithoutLetter
    @ExcludedLetter NVARCHAR(1) -- Параметр для заданной буквы
AS
BEGIN
    SELECT 
        COUNT(*) AS CountryCount
    FROM 
        Страны
    WHERE 
        [Name] NOT LIKE '%' + @ExcludedLetter + '%'; -- Проверка на отсутствие буквы
END;

-- Вызов процедуры с примером (буква 'А')
EXEC CountCountriesWithoutLetter @ExcludedLetter = N'А';

/* 6 */

CREATE PROCEDURE FiveCountriesInAfrica
    @Continent AS NVARCHAR(50) = 'Африка'
AS
BEGIN
    SELECT TOP 5
        [Name], 
        [Population]
    FROM 
        Страны
    WHERE 
        [Continent] = @Continent
    ORDER BY 
        [Population] DESC;
END

EXEC FiveCountriesInAfrica

/* 7 */

CREATE PROCEDURE CreateAndPopulateCountriesTable
    @FirstLetter NVARCHAR(1) -- Параметр для первой буквы
AS
BEGIN
    -- Динамическое создание имени таблицы
    DECLARE @TableName NVARCHAR(50) = N'Страны_' + @FirstLetter;

    -- Проверка на существование таблицы, удаление при необходимости
    IF OBJECT_ID(@TableName, 'U') IS NOT NULL
    BEGIN
        DROP TABLE [dbo].[@TableName];
    END

    -- Создание новой таблицы
    DECLARE @CreateTableSQL NVARCHAR(MAX) =
        N'CREATE TABLE ' + @TableName + N' (
            [Name] NVARCHAR(100),
            [Metropolis] NVARCHAR(100),
            [Area] INT,
            [Population] INT,
            [Continent] NVARCHAR(100)
        )';
    EXEC sp_executesql @CreateTableSQL;

    -- Вставка данных в новую таблицу
    DECLARE @InsertDataSQL NVARCHAR(MAX) =
        N'INSERT INTO ' + @TableName + N'
          SELECT [Name], [Metropolis], [Area], [Population], [Continent]
          FROM Страны
          WHERE [Name] LIKE ' + '''' + @FirstLetter + '%''';
    EXEC sp_executesql @InsertDataSQL;

    -- Подтверждение успешного выполнения
    PRINT 'Таблица ' + @TableName + ' создана и заполнена.';
END;

-- Вызов процедуры с буквой "К" (пример)
EXEC CreateAndPopulateCountriesTable @FirstLetter = N'И';

/* 8 */

CREATE PROCEDURE DropTableAndCountRows
    @FirstLetter NVARCHAR(1) -- Первая буква для имени таблицы
AS
BEGIN
    -- Динамическое создание имени таблицы
    DECLARE @TableName NVARCHAR(50) = N'Страны_' + @FirstLetter;
    
    -- Проверка существования таблицы
    IF OBJECT_ID(@TableName, 'U') IS NOT NULL
    BEGIN
        -- Подсчёт количества строк в таблице
        DECLARE @RowCount INT;
        DECLARE @CountRowsSQL NVARCHAR(MAX) =
            N'SELECT @RowCountOUT = COUNT(*) FROM ' + @TableName;

        EXEC sp_executesql @CountRowsSQL, N'@RowCountOUT INT OUTPUT', @RowCount OUTPUT;

        -- Удаление таблицы
        DECLARE @DropTableSQL NVARCHAR(MAX) = N'DROP TABLE ' + @TableName;
        EXEC sp_executesql @DropTableSQL;

        -- Возврат количества строк
        PRINT 'Таблица ' + @TableName + ' удалена.';
        PRINT 'Количество удалённых строк: ' + CAST(@RowCount AS NVARCHAR);
    END
    ELSE
    BEGIN
        PRINT 'Таблица ' + @TableName + ' не существует.';
    END
END;

-- Вызов процедуры с буквой "К" (пример)
EXEC DropTableAndCountRows @FirstLetter = N'И';

/* 9 */

CREATE PROCEDURE CountDigitsInNumber
    @InputNumber BIGINT,        -- Входной параметр: число
    @DigitCount INT OUTPUT      -- Выходной параметр: количество цифр
AS
BEGIN
    -- Преобразование числа в строку и подсчёт длины строки
    SET @DigitCount = LEN(CAST(ABS(@InputNumber) AS NVARCHAR(MAX)));

    -- Вывод результата
    PRINT 'Количество цифр в числе: ' + CAST(@DigitCount AS NVARCHAR);
END;

-- Пример вызова процедуры
DECLARE @Result INT;
EXEC CountDigitsInNumber @InputNumber = -123456, @DigitCount = @Result OUTPUT;
PRINT 'Результат через OUTPUT параметр: ' + CAST(@Result AS NVARCHAR);

/* 10 */

CREATE PROCEDURE AddRightDigit
    @K INT OUTPUT,     -- Параметр, одновременно входной и выходной
    @D INT             -- Параметр для добавляемой цифры
AS
BEGIN
    -- Проверка входных параметров
    IF @D NOT BETWEEN 0 AND 9
    BEGIN
        PRINT 'Ошибка: параметр D должен быть цифрой от 0 до 9.';
        RETURN;
    END

    IF @K < 0
    BEGIN
        PRINT 'Ошибка: параметр K должен быть положительным числом.';
        RETURN;
    END

    -- Добавление цифры к числу K
    SET @K = @K * 10 + @D;

    -- Вывод результата
    PRINT 'Результат после добавления цифры: ' + CAST(@K AS NVARCHAR);
END;

-- Пример вызова процедуры
DECLARE @K INT = 123; -- Исходное число
DECLARE @D INT = 4;   -- Цифра для добавления
EXEC AddRightDigit @K OUTPUT, @D;
PRINT 'Результат через OUTPUT параметр: ' + CAST(@K AS NVARCHAR);

/* 11 */

CREATE PROCEDURE InvDigit
    @K INT OUTPUT -- Параметр, одновременно входной и выходной
AS
BEGIN
    -- Проверка входного параметра
    IF @K < 0
    BEGIN
        PRINT 'Ошибка: параметр K должен быть положительным числом.';
        RETURN;
    END

    -- Логика инверсии порядка цифр
    DECLARE @Reversed INT = 0; -- Переменная для хранения обратного числа
    DECLARE @Temp INT = @K;    -- Временная переменная для вычислений

    WHILE @Temp > 0
    BEGIN
        SET @Reversed = @Reversed * 10 + @Temp % 10; -- Добавляем последнюю цифру к результату
        SET @Temp = @Temp / 10;                     -- Убираем последнюю цифру из числа
    END

    -- Присваиваем обратно в параметр @K
    SET @K = @Reversed;

    -- Вывод результата
    PRINT 'Число с перевёрнутыми цифрами: ' + CAST(@K AS NVARCHAR);
END;

-- Пример вызова процедуры
DECLARE @K INT = 12345; -- Исходное число
EXEC InvDigit @K OUTPUT;
PRINT 'Результат через OUTPUT параметр: ' + CAST(@K AS NVARCHAR);

/* 12 */

CREATE PROCEDURE Swap
    @X FLOAT OUTPUT, -- Параметр X, входной и выходной
    @Y FLOAT OUTPUT  -- Параметр Y, входной и выходной
AS
BEGIN
    -- Логика обмена значениями
    DECLARE @Temp FLOAT; -- Временная переменная для хранения значения
    SET @Temp = @X;
    SET @X = @Y;
    SET @Y = @Temp;

    -- Вывод результата
    PRINT 'Значения переменных после обмена:';
    PRINT 'X = ' + CAST(@X AS NVARCHAR);
    PRINT 'Y = ' + CAST(@Y AS NVARCHAR);
END;

-- Пример вызова процедуры
DECLARE @X FLOAT = 3.14, @Y FLOAT = 2.71; -- Исходные значения
EXEC Swap @X OUTPUT, @Y OUTPUT;
PRINT 'Результат через OUTPUT параметры:';
PRINT 'X = ' + CAST(@X AS NVARCHAR);
PRINT 'Y = ' + CAST(@Y AS NVARCHAR);

/* 13 */

CREATE PROCEDURE SortInc
    @A FLOAT OUTPUT, -- Параметр A, входной и выходной
    @B FLOAT OUTPUT, -- Параметр B, входной и выходной
    @C FLOAT OUTPUT  -- Параметр C, входной и выходной
AS
BEGIN
    -- Логика сортировки по возрастанию
    DECLARE @Temp FLOAT;

    -- Сравнение A и B
    IF @A > @B
    BEGIN
        SET @Temp = @A;
        SET @A = @B;
        SET @B = @Temp;
    END

    -- Сравнение B и C
    IF @B > @C
    BEGIN
        SET @Temp = @B;
        SET @B = @C;
        SET @C = @Temp;
    END

    -- Повторная проверка A и B (после изменения)
    IF @A > @B
    BEGIN
        SET @Temp = @A;
        SET @A = @B;
        SET @B = @Temp;
    END

    -- Вывод результата
    PRINT 'Значения переменных после сортировки:';
    PRINT 'A = ' + CAST(@A AS NVARCHAR);
    PRINT 'B = ' + CAST(@B AS NVARCHAR);
    PRINT 'C = ' + CAST(@C AS NVARCHAR);
END;

-- Пример вызова процедуры
DECLARE @A FLOAT = 7.5, @B FLOAT = 3.2, @C FLOAT = 5.8; -- Исходные значения
EXEC SortInc @A OUTPUT, @B OUTPUT, @C OUTPUT;

PRINT 'Результат через OUTPUT параметры:';
PRINT 'A = ' + CAST(@A AS NVARCHAR);
PRINT 'B = ' + CAST(@B AS NVARCHAR);
PRINT 'C = ' + CAST(@C AS NVARCHAR);

/* 14 */

CREATE PROCEDURE DigitCountSum
    @K INT,         -- Входной параметр: целое положительное число
    @C INT OUTPUT,  -- Выходной параметр: количество цифр
    @S INT OUTPUT   -- Выходной параметр: сумма цифр
AS
BEGIN
    -- Проверка на положительность числа
    IF @K < 0
    BEGIN
        PRINT 'Ошибка: параметр K должен быть положительным числом.';
        RETURN;
    END

    -- Инициализация выходных параметров
    SET @C = 0;  -- Количество цифр
    SET @S = 0;  -- Сумма цифр

    -- Логика подсчета цифр и их суммы
    DECLARE @Temp INT = @K;

    WHILE @Temp > 0
    BEGIN
        SET @S = @S + (@Temp % 10);  -- Добавляем последнюю цифру к сумме
        SET @C = @C + 1;             -- Увеличиваем количество цифр
        SET @Temp = @Temp / 10;      -- Убираем последнюю цифру из числа
    END

    -- Вывод результата
    PRINT 'Количество цифр: ' + CAST(@C AS NVARCHAR);
    PRINT 'Сумма цифр: ' + CAST(@S AS NVARCHAR);
END;

-- Пример вызова процедуры
DECLARE @K INT = 12345; -- Исходное число
DECLARE @C INT, @S INT;  -- Переменные для результата
EXEC DigitCountSum @K, @C OUTPUT, @S OUTPUT;

-- Вывод результата
PRINT 'Результат через OUTPUT параметры:';
PRINT 'Количество цифр: ' + CAST(@C AS NVARCHAR);
PRINT 'Сумма цифр: ' + CAST(@S AS NVARCHAR);

/* 15 */

DECLARE @ProcedureName NVARCHAR(255);

-- Курсор для получения имен всех хранимых процедур
DECLARE ProcedureCursor CURSOR FOR
    SELECT name
    FROM sys.objects
    WHERE type = 'P' AND name LIKE '%%'; -- Все процедуры

-- Открываем курсор
OPEN ProcedureCursor;

-- Извлекаем имена процедур и удаляем их
FETCH NEXT FROM ProcedureCursor INTO @ProcedureName;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Формируем динамический SQL для удаления процедуры
    DECLARE @SQL NVARCHAR(MAX);
    SET @SQL = 'DROP PROCEDURE ' + QUOTENAME(@ProcedureName);
    
    -- Выполняем динамический SQL
    EXEC sp_executesql @SQL;

    -- Переходим к следующей процедуре
    FETCH NEXT FROM ProcedureCursor INTO @ProcedureName;
END;

-- Закрываем и удаляем курсор
CLOSE ProcedureCursor;
DEALLOCATE ProcedureCursor;

PRINT 'Все хранимые процедуры были удалены.';