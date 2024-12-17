CREATE TABLE ������ (
    [Name]  NVARCHAR(100),
    [Metropolis] NVARCHAR(100),
	[Area] INT,
    [Population] INT,
    [Continent] NVARCHAR(100)
);
INSERT ������ Values
('�������', '����', '83858', '8741753', '������'),
('�����������', '����', '86600', '9705600', '����'),
('�������', '������', '28748', '2866026', '������'),
('�����', '�����', '2381740', '39813722', '������'),
('������', '������', '1246700', '25831000', '������'),
('���������', '������-�����', '2766890', '43847000', '����� �������'),
('����������', '�����', '647500', '29822848', '����'),
('���������', '�����', '144000', '160221000', '����'),
('�������', '������', '701', '1397000', '����'),
('�����', '���������', '22966', '377968', '�������� �������'),
('����������', '�����', '207595', '9498400', '������'),
('�������', '��������', '30528', '11250585', '������'),
('�����', '�����-����', '112620', '11167000', '������'),
('��������', '�����', '110910', '7153784', '������'),
('�������', '�����', '1098580', '10985059', '����� �������'),
('��������', '��������', '600370', '2209208', '������'),
('��������', '��������', '8511965', '206081432', '����� �������'),
('�������-����', '��������', '274200', '19034397', '������'),
('�����', '�������', '47000', '784000', '����'),
('��������������', '������', '244820', '65341183', '������'),
('�������', '��������', '93030', '9830485', '������'),
('���������', '�������', '912050', '31028637', '����� �������'),
('��������� �����', '����', '14874', '1167242', '����'),
('�������', '�����', '329560', '91713300', '����');

/* 1 */

CREATE PROCEDURE GetSystemInfo
AS
BEGIN
    -- ���������� � �������
    SELECT @@SERVERNAME AS ServerName;

    -- ���������� � ���� ������
    SELECT DB_NAME() AS DatabaseName;

    -- ���������� � ������� ������������
    SELECT SUSER_NAME() AS CurrentUser;

    -- ������� �����
    SELECT GETDATE() AS CurrentTime;
END

EXEC GetSystemInfo;

/* 2 */

CREATE PROCEDURE CountryFunc
AS
BEGIN
    SELECT [Name], [Metropolis], [Continent]
    FROM ������;
END

EXEC CountryFunc;

/* 3 */

CREATE PROCEDURE ���������
    @excluded_continent NVARCHAR(100)
AS
BEGIN
    SELECT [Name]
    FROM ������
    WHERE [Continent] <> @excluded_continent;
END;

EXEC ��������� @excluded_continent = N'������';

/* 4 */

CREATE PROCEDURE CountriesByPopulationRange
    @MinPopulation INT,
    @MaxPopulation INT
AS
BEGIN
    SELECT 
        [Name] AS '������', 
        [Population] AS '���������', 
        [Metropolis] AS '�������', 
        [Continent] AS '���������'
    FROM 
        ������
    WHERE 
        [Population] BETWEEN @MinPopulation AND @MaxPopulation;
END;

-- ����� ��������� � ��������� ���������� ���������
EXEC CountriesByPopulationRange @MinPopulation = 10000000, @MaxPopulation = 50000000;

/* 5 */

CREATE PROCEDURE CountCountriesWithoutLetter
    @ExcludedLetter NVARCHAR(1) -- �������� ��� �������� �����
AS
BEGIN
    SELECT 
        COUNT(*) AS CountryCount
    FROM 
        ������
    WHERE 
        [Name] NOT LIKE '%' + @ExcludedLetter + '%'; -- �������� �� ���������� �����
END;

-- ����� ��������� � �������� (����� '�')
EXEC CountCountriesWithoutLetter @ExcludedLetter = N'�';

/* 6 */

CREATE PROCEDURE FiveCountriesInAfrica
    @Continent AS NVARCHAR(50) = '������'
AS
BEGIN
    SELECT TOP 5
        [Name], 
        [Population]
    FROM 
        ������
    WHERE 
        [Continent] = @Continent
    ORDER BY 
        [Population] DESC;
END

EXEC FiveCountriesInAfrica

/* 7 */

CREATE PROCEDURE CreateAndPopulateCountriesTable
    @FirstLetter NVARCHAR(1) -- �������� ��� ������ �����
AS
BEGIN
    -- ������������ �������� ����� �������
    DECLARE @TableName NVARCHAR(50) = N'������_' + @FirstLetter;

    -- �������� �� ������������� �������, �������� ��� �������������
    IF OBJECT_ID(@TableName, 'U') IS NOT NULL
    BEGIN
        DROP TABLE [dbo].[@TableName];
    END

    -- �������� ����� �������
    DECLARE @CreateTableSQL NVARCHAR(MAX) =
        N'CREATE TABLE ' + @TableName + N' (
            [Name] NVARCHAR(100),
            [Metropolis] NVARCHAR(100),
            [Area] INT,
            [Population] INT,
            [Continent] NVARCHAR(100)
        )';
    EXEC sp_executesql @CreateTableSQL;

    -- ������� ������ � ����� �������
    DECLARE @InsertDataSQL NVARCHAR(MAX) =
        N'INSERT INTO ' + @TableName + N'
          SELECT [Name], [Metropolis], [Area], [Population], [Continent]
          FROM ������
          WHERE [Name] LIKE ' + '''' + @FirstLetter + '%''';
    EXEC sp_executesql @InsertDataSQL;

    -- ������������� ��������� ����������
    PRINT '������� ' + @TableName + ' ������� � ���������.';
END;

-- ����� ��������� � ������ "�" (������)
EXEC CreateAndPopulateCountriesTable @FirstLetter = N'�';

/* 8 */

CREATE PROCEDURE DropTableAndCountRows
    @FirstLetter NVARCHAR(1) -- ������ ����� ��� ����� �������
AS
BEGIN
    -- ������������ �������� ����� �������
    DECLARE @TableName NVARCHAR(50) = N'������_' + @FirstLetter;
    
    -- �������� ������������� �������
    IF OBJECT_ID(@TableName, 'U') IS NOT NULL
    BEGIN
        -- ������� ���������� ����� � �������
        DECLARE @RowCount INT;
        DECLARE @CountRowsSQL NVARCHAR(MAX) =
            N'SELECT @RowCountOUT = COUNT(*) FROM ' + @TableName;

        EXEC sp_executesql @CountRowsSQL, N'@RowCountOUT INT OUTPUT', @RowCount OUTPUT;

        -- �������� �������
        DECLARE @DropTableSQL NVARCHAR(MAX) = N'DROP TABLE ' + @TableName;
        EXEC sp_executesql @DropTableSQL;

        -- ������� ���������� �����
        PRINT '������� ' + @TableName + ' �������.';
        PRINT '���������� �������� �����: ' + CAST(@RowCount AS NVARCHAR);
    END
    ELSE
    BEGIN
        PRINT '������� ' + @TableName + ' �� ����������.';
    END
END;

-- ����� ��������� � ������ "�" (������)
EXEC DropTableAndCountRows @FirstLetter = N'�';

/* 9 */

CREATE PROCEDURE CountDigitsInNumber
    @InputNumber BIGINT,        -- ������� ��������: �����
    @DigitCount INT OUTPUT      -- �������� ��������: ���������� ����
AS
BEGIN
    -- �������������� ����� � ������ � ������� ����� ������
    SET @DigitCount = LEN(CAST(ABS(@InputNumber) AS NVARCHAR(MAX)));

    -- ����� ����������
    PRINT '���������� ���� � �����: ' + CAST(@DigitCount AS NVARCHAR);
END;

-- ������ ������ ���������
DECLARE @Result INT;
EXEC CountDigitsInNumber @InputNumber = -123456, @DigitCount = @Result OUTPUT;
PRINT '��������� ����� OUTPUT ��������: ' + CAST(@Result AS NVARCHAR);

/* 10 */

CREATE PROCEDURE AddRightDigit
    @K INT OUTPUT,     -- ��������, ������������ ������� � ��������
    @D INT             -- �������� ��� ����������� �����
AS
BEGIN
    -- �������� ������� ����������
    IF @D NOT BETWEEN 0 AND 9
    BEGIN
        PRINT '������: �������� D ������ ���� ������ �� 0 �� 9.';
        RETURN;
    END

    IF @K < 0
    BEGIN
        PRINT '������: �������� K ������ ���� ������������� ������.';
        RETURN;
    END

    -- ���������� ����� � ����� K
    SET @K = @K * 10 + @D;

    -- ����� ����������
    PRINT '��������� ����� ���������� �����: ' + CAST(@K AS NVARCHAR);
END;

-- ������ ������ ���������
DECLARE @K INT = 123; -- �������� �����
DECLARE @D INT = 4;   -- ����� ��� ����������
EXEC AddRightDigit @K OUTPUT, @D;
PRINT '��������� ����� OUTPUT ��������: ' + CAST(@K AS NVARCHAR);

/* 11 */

CREATE PROCEDURE InvDigit
    @K INT OUTPUT -- ��������, ������������ ������� � ��������
AS
BEGIN
    -- �������� �������� ���������
    IF @K < 0
    BEGIN
        PRINT '������: �������� K ������ ���� ������������� ������.';
        RETURN;
    END

    -- ������ �������� ������� ����
    DECLARE @Reversed INT = 0; -- ���������� ��� �������� ��������� �����
    DECLARE @Temp INT = @K;    -- ��������� ���������� ��� ����������

    WHILE @Temp > 0
    BEGIN
        SET @Reversed = @Reversed * 10 + @Temp % 10; -- ��������� ��������� ����� � ����������
        SET @Temp = @Temp / 10;                     -- ������� ��������� ����� �� �����
    END

    -- ����������� ������� � �������� @K
    SET @K = @Reversed;

    -- ����� ����������
    PRINT '����� � ������������ �������: ' + CAST(@K AS NVARCHAR);
END;

-- ������ ������ ���������
DECLARE @K INT = 12345; -- �������� �����
EXEC InvDigit @K OUTPUT;
PRINT '��������� ����� OUTPUT ��������: ' + CAST(@K AS NVARCHAR);

/* 12 */

CREATE PROCEDURE Swap
    @X FLOAT OUTPUT, -- �������� X, ������� � ��������
    @Y FLOAT OUTPUT  -- �������� Y, ������� � ��������
AS
BEGIN
    -- ������ ������ ����������
    DECLARE @Temp FLOAT; -- ��������� ���������� ��� �������� ��������
    SET @Temp = @X;
    SET @X = @Y;
    SET @Y = @Temp;

    -- ����� ����������
    PRINT '�������� ���������� ����� ������:';
    PRINT 'X = ' + CAST(@X AS NVARCHAR);
    PRINT 'Y = ' + CAST(@Y AS NVARCHAR);
END;

-- ������ ������ ���������
DECLARE @X FLOAT = 3.14, @Y FLOAT = 2.71; -- �������� ��������
EXEC Swap @X OUTPUT, @Y OUTPUT;
PRINT '��������� ����� OUTPUT ���������:';
PRINT 'X = ' + CAST(@X AS NVARCHAR);
PRINT 'Y = ' + CAST(@Y AS NVARCHAR);

/* 13 */

CREATE PROCEDURE SortInc
    @A FLOAT OUTPUT, -- �������� A, ������� � ��������
    @B FLOAT OUTPUT, -- �������� B, ������� � ��������
    @C FLOAT OUTPUT  -- �������� C, ������� � ��������
AS
BEGIN
    -- ������ ���������� �� �����������
    DECLARE @Temp FLOAT;

    -- ��������� A � B
    IF @A > @B
    BEGIN
        SET @Temp = @A;
        SET @A = @B;
        SET @B = @Temp;
    END

    -- ��������� B � C
    IF @B > @C
    BEGIN
        SET @Temp = @B;
        SET @B = @C;
        SET @C = @Temp;
    END

    -- ��������� �������� A � B (����� ���������)
    IF @A > @B
    BEGIN
        SET @Temp = @A;
        SET @A = @B;
        SET @B = @Temp;
    END

    -- ����� ����������
    PRINT '�������� ���������� ����� ����������:';
    PRINT 'A = ' + CAST(@A AS NVARCHAR);
    PRINT 'B = ' + CAST(@B AS NVARCHAR);
    PRINT 'C = ' + CAST(@C AS NVARCHAR);
END;

-- ������ ������ ���������
DECLARE @A FLOAT = 7.5, @B FLOAT = 3.2, @C FLOAT = 5.8; -- �������� ��������
EXEC SortInc @A OUTPUT, @B OUTPUT, @C OUTPUT;

PRINT '��������� ����� OUTPUT ���������:';
PRINT 'A = ' + CAST(@A AS NVARCHAR);
PRINT 'B = ' + CAST(@B AS NVARCHAR);
PRINT 'C = ' + CAST(@C AS NVARCHAR);

/* 14 */

CREATE PROCEDURE DigitCountSum
    @K INT,         -- ������� ��������: ����� ������������� �����
    @C INT OUTPUT,  -- �������� ��������: ���������� ����
    @S INT OUTPUT   -- �������� ��������: ����� ����
AS
BEGIN
    -- �������� �� ��������������� �����
    IF @K < 0
    BEGIN
        PRINT '������: �������� K ������ ���� ������������� ������.';
        RETURN;
    END

    -- ������������� �������� ����������
    SET @C = 0;  -- ���������� ����
    SET @S = 0;  -- ����� ����

    -- ������ �������� ���� � �� �����
    DECLARE @Temp INT = @K;

    WHILE @Temp > 0
    BEGIN
        SET @S = @S + (@Temp % 10);  -- ��������� ��������� ����� � �����
        SET @C = @C + 1;             -- ����������� ���������� ����
        SET @Temp = @Temp / 10;      -- ������� ��������� ����� �� �����
    END

    -- ����� ����������
    PRINT '���������� ����: ' + CAST(@C AS NVARCHAR);
    PRINT '����� ����: ' + CAST(@S AS NVARCHAR);
END;

-- ������ ������ ���������
DECLARE @K INT = 12345; -- �������� �����
DECLARE @C INT, @S INT;  -- ���������� ��� ����������
EXEC DigitCountSum @K, @C OUTPUT, @S OUTPUT;

-- ����� ����������
PRINT '��������� ����� OUTPUT ���������:';
PRINT '���������� ����: ' + CAST(@C AS NVARCHAR);
PRINT '����� ����: ' + CAST(@S AS NVARCHAR);

/* 15 */

DECLARE @ProcedureName NVARCHAR(255);

-- ������ ��� ��������� ���� ���� �������� ��������
DECLARE ProcedureCursor CURSOR FOR
    SELECT name
    FROM sys.objects
    WHERE type = 'P' AND name LIKE '%%'; -- ��� ���������

-- ��������� ������
OPEN ProcedureCursor;

-- ��������� ����� �������� � ������� ��
FETCH NEXT FROM ProcedureCursor INTO @ProcedureName;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- ��������� ������������ SQL ��� �������� ���������
    DECLARE @SQL NVARCHAR(MAX);
    SET @SQL = 'DROP PROCEDURE ' + QUOTENAME(@ProcedureName);
    
    -- ��������� ������������ SQL
    EXEC sp_executesql @SQL;

    -- ��������� � ��������� ���������
    FETCH NEXT FROM ProcedureCursor INTO @ProcedureName;
END;

-- ��������� � ������� ������
CLOSE ProcedureCursor;
DEALLOCATE ProcedureCursor;

PRINT '��� �������� ��������� ���� �������.';