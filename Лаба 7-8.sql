INSERT INTO [dbo].[County] (ID, Name, Metropolis, Area, Population, Continent)
VALUES
(1, '�������', '����', 83858, 8741753, '������'),
(2, '�����������', '����', 86600, 9705600, '����'),
(3, '�������', '������', 28748, 2866026, '������'),
(4, '�����', '�����', 2381740, 39813722, '������'),
(5, '������', '������', 1246700, 25831000, '������'),
(6, '���������', '������-�����', 2766890, 43847000, '����� �������'),
(7, '����������', '�����', 647500, 29822848, '����'),
(8, '���������', '�����', 144000, 160221000, '����'),
(9, '�������', '������', 701, 1397000, '����'),
(10, '�����', '���������', 22966, 377968, '�������� �������'),
(11, '����������', '�����', 207595, 9498400, '������'),
(12, '�������', '��������', 30528, 11250585, '������'),
(13, '�����', '�����-����', 112620, 11167000, '������'),
(14, '��������', '�����', 110910, 7153784, '������'),
(15, '�������', '�����', 1098580, 10985059, '����� �������'),
(16, '��������', '��������', 600370, 2209208, '������'),
(17, '��������', '��������', 8511965, 206081432, '����� �������'),
(18, '�������-����', '��������', 274200, 19034397, '������'),
(19, '�����', '�������', 47000, 784000, '����'),
(20, '��������������', '������', 244820, 65341183, '������'),
(21, '�������', '��������', 93030, 9830485, '������'),
(22, '���������', '�������', 912050, 31028637, '����� �������'),
(23, '��������� �����', '����', 14874, 1167242, '����'),
(24, '�������', '�����', 329560, 91713300, '����');

/* ������� 1 */
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

/* ������� 2 */
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

/* ������� 3 */
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

/* ���� 7 */
/* ������� 1 */
SELECT 
    Name,
    Metropolis,
    Area,
    (CAST(Area AS FLOAT) / (SELECT SUM(Area) FROM [dbo].[County]) * 100) AS AreaPercentage
FROM [dbo].[County];

/* ������� 2 */
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

/* ������� 3 */
SELECT 
    Name,
    Metropolis,
    Area,
    Population,
    Continent
FROM [dbo].[County]
WHERE
	Continent = '������' 
	AND Population < 5000000;

/* � ����������� ���������� */

SELECT 
    Name,
    Metropolis,
    Area,
    Population,
    Continent
FROM [dbo].[County]
WHERE
	Continent = '������' 
	AND Population < 5000000
	AND Name IN
	(SELECT 
		Name 
	FROM [dbo].[County] 
	WHERE Continent = '������');

/* ������� 4 */
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

/* ������� 5 */
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

/* ������� 6 */
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
