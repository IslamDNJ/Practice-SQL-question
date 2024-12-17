/* ������� 1 */
DECLARE @a INT, @b INT, @c INT 
SET @a = 5  
SET @b = 10 
SET @c = @a + @b 
PRINT @c

/* ������� 2 */
WITH AverageScores AS (
    SELECT 
        �����,
        AVG(�����) AS �����������
    FROM 
        �������
    WHERE 
        ����� IN ('�����', '��������') -- ������ �� ���� ����
    GROUP BY 
        �����
)
SELECT 
    ABS(
        (SELECT ����������� FROM AverageScores WHERE ����� = '�����') -
        (SELECT ����������� FROM AverageScores WHERE ����� = '��������')
    ) AS �������
;

/* ������� 3 */
SELECT 
    CASE 
        WHEN COUNT(*) % 2 = 0 THEN '������' 
        ELSE '��������' 
    END AS ���������������
FROM �������;

/* ������� 4 */
DECLARE @����� INT = 1234;
DECLARE @����� INT = 0;

WHILE @����� > 0
BEGIN
    SET @����� = @����� + @����� % 10;
    SET @����� = @����� / 10;
END;

PRINT @�����

/* ������� 5 */
DECLARE @a INT = 5, @b INT = 10, @c INT = 15
DECLARE @min INT
SET @min = @a
IF @b < @min SET @min = @b
IF @c < @min SET @min = @c
PRINT @min

/* ������� 6 */
DECLARE @a INT = 33;
PRINT CASE WHEN @a % 11 = 0 THEN '�������' ELSE '�� �������' END;

/* ������� 7 */
DECLARE @N INT = 27;
WHILE @N > 1 AND @N % 3 = 0
    SET @N = @N / 3;

PRINT CASE WHEN @N = 1 THEN '��' ELSE '���' END;

/* ������� 8 */
DECLARE @a INT = rand() * 100, @b INT = rand() * 100;
DECLARE @��� INT = (@a * @b) / (SELECT MAX(��������) FROM (VALUES (1), (@a % @b), (@b % @a)) AS x(��������));
PRINT @���;

/* ������� 9 */
DECLARE @A INT = 2, @B INT = 5;
DECLARE @����� INT = 0;

WITH ����� AS (
    SELECT @A AS �����
    UNION ALL
    SELECT ����� + 1 FROM ����� WHERE ����� < @B
)
SELECT SUM(����� * �����) AS �������������� FROM �����;

/* ������� 10 */
DECLARE @N INT = 1;

WHILE NOT (@N % 2 = 1 AND @N % 3 = 1 AND @N % 4 = 1 AND @N % 5 = 1 AND @N % 6 = 1 AND @N % 7 = 0)
    SET @N = @N + 1;

PRINT @N;

/* ������� 11 */
DECLARE @surname NVARCHAR(50) = '�����'
DECLARE @length INT = LEN(@surname), @counter INT = 1
WHILE @counter <= @length
BEGIN
    PRINT @surname
    SET @counter = @counter + 1
END

/* ������� 12 */
DECLARE @text NVARCHAR(50) = '���������'
DECLARE @i INT = 1
DECLARE @spaces NVARCHAR(50)
DECLARE @length INT = LEN(@text)

WHILE @i <= @length
BEGIN
    SET @spaces = REPLICATE(' ', @length - @i) -- ������� ��� ���������
    PRINT @spaces + LEFT(@text, @i) + REVERSE(LEFT(@text, @i - 1)) -- ����� � ��� ���������� ���������
    SET @i = @i + 1
END