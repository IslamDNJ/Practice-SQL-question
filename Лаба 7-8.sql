INSERT INTO [dbo].[County] (ID, Name, Metropolis, Area, Population, Continent)
VALUES
(1, 'Австрия', 'Вена', 83858, 8741753, 'Европа'),
(2, 'Азербайджан', 'Баку', 86600, 9705600, 'Азия'),
(3, 'Албания', 'Тирана', 28748, 2866026, 'Европа'),
(4, 'Алжир', 'Алжир', 2381740, 39813722, 'Африка'),
(5, 'Ангола', 'Луанда', 1246700, 25831000, 'Африка'),
(6, 'Аргентина', 'Буэнос-Айрес', 2766890, 43847000, 'Южная Америка'),
(7, 'Афганистан', 'Кабул', 647500, 29822848, 'Азия'),
(8, 'Бангладеш', 'Дакка', 144000, 160221000, 'Азия'),
(9, 'Бахрейн', 'Манама', 701, 1397000, 'Азия'),
(10, 'Белиз', 'Бельмопан', 22966, 377968, 'Северная Америка'),
(11, 'Белоруссия', 'Минск', 207595, 9498400, 'Европа'),
(12, 'Бельгия', 'Брюссель', 30528, 11250585, 'Европа'),
(13, 'Бенин', 'Порто-Ново', 112620, 11167000, 'Африка'),
(14, 'Болгария', 'София', 110910, 7153784, 'Европа'),
(15, 'Боливия', 'Сукре', 1098580, 10985059, 'Южная Америка'),
(16, 'Ботсвана', 'Габороне', 600370, 2209208, 'Африка'),
(17, 'Бразилия', 'Бразилиа', 8511965, 206081432, 'Южная Америка'),
(18, 'Буркина-Фасо', 'Уагадугу', 274200, 19034397, 'Африка'),
(19, 'Бутан', 'Тхимпху', 47000, 784000, 'Азия'),
(20, 'Великобритания', 'Лондон', 244820, 65341183, 'Европа'),
(21, 'Венгрия', 'Будапешт', 93030, 9830485, 'Европа'),
(22, 'Венесуэла', 'Каракас', 912050, 31028637, 'Южная Америка'),
(23, 'Восточный Тимор', 'Дили', 14874, 1167242, 'Азия'),
(24, 'Вьетнам', 'Ханой', 329560, 91713300, 'Азия');

/* Задание 1 */
SELECT
	Name, 
	Metropolis, 
	Area, 
	Population, 
	Continent
FROM [dbo].[County]
WHERE Area < 500

UNION

SELECT
	Name, 
	Metropolis, 
	Area, 
	Population, 
	Continent
FROM [dbo].[County]
WHERE Area > 5000000;

/* Задание 2 */
SELECT
	Name, 
	Metropolis, 
	Area, 
	Population, 
	Continent
FROM [dbo].[County]
WHERE
	Area > 1000000 AND 
	Population >= 100000000;

/* Задание 3 */
SELECT
	Name, 
	Metropolis, 
	Area, 
	Population, 
	Continent
FROM [dbo].[County]
WHERE
	Area < 500 AND 
	Population < 100000;

/* Лаба 7 */
/* Задание 1 */
SELECT 
    Name,
    Metropolis,
    Area,
    (CAST(Area AS FLOAT) / (SELECT SUM(Area) FROM [dbo].[County]) * 100) AS AreaPercentage
FROM [dbo].[County];

/* Задание 2 */
SELECT 
    Name,
    Metropolis,
    Area,
    Population,
    (Population / CAST(Area AS FLOAT)) AS PopulationDensity
FROM [dbo].[County]
WHERE 
	(Population / CAST(Area AS FLOAT)) > 
    (SELECT AVG(Population / CAST(Area AS FLOAT)) FROM [dbo].[County]);

/* Задание 3 */
SELECT 
    Name,
    Metropolis,
    Area,
    Population,
    Continent
FROM [dbo].[County]
WHERE
	Continent = 'Европа' 
	AND Population < 5000000;

/* С выполнением падзапроса */

SELECT 
    Name,
    Metropolis,
    Area,
    Population,
    Continent
FROM [dbo].[County]
WHERE
	Continent = 'Европа' 
	AND Population < 5000000
	AND Name IN
	(SELECT 
		Name 
	FROM [dbo].[County] 
	WHERE Continent = 'Европа');

/* Задание 4 */
SELECT 
	Name,
    Metropolis,
    Area,
    Continent,
    (CAST(Area AS FLOAT) / 
        (SELECT SUM(Area) 
         FROM [dbo].[County] AS continent_sum
         WHERE continent_sum.Continent = County.Continent) * 100) AS AreaPercentage
FROM [dbo].[County];

/* Задание 5 */
SELECT 
    Name,
    Metropolis,
    Area,
    Population,
    Continent
FROM [dbo].[County] AS country
WHERE 
	Area > 
    (SELECT AVG(Area)
    FROM [dbo].[County] AS continent_avg
	WHERE continent_avg.Continent = country.Continent);

/* Задание 6 */
SELECT 
    Name,
    Metropolis,
    Area,
    Population,
    Continent
FROM [dbo].[County] AS country
WHERE 
	Continent IN (
    SELECT Continent
    FROM [dbo].[County]
    GROUP BY Continent
    HAVING AVG(Population / CAST(Area AS FLOAT)) > 
		(SELECT AVG(Population / CAST(Area AS FLOAT)) 
		FROM [dbo].[County])
	);
