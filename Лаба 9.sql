INSERT INTO Country (��������, �������, �����_�����, ���������, �������, ���_����������)
VALUES 
('�������', '����', '84', '7513', '������', '4'),
('��������������', '������', '244', '55928', '������', '1'),
('������', '�����', '132', '9280', '������', '4'),
('����������', '�����', '647', '20340', '����', '3'),
('��������', '����-�����', '1565', '1555', '����', '4'),
('������', '�����', '372', '114276', '����', '1'),
('�������', '�����', '551', '53183', '������', '3'),
('������', '���������', '450', '8268', '������', '1'),
('������', '����', '1001', '38740', '������', '3'),
('������', '��������', '638', '3350', '������', '-'),
('���', '���������', '9363', '217700', '�������', '3'),
('�������', '������', '1973', '62500', '�������', '4'),
('������', '��������', '0.3', '330', '������', '4'),
('������', '������', '0.2', '25', '������', '1');


CREATE TABLE Country (
    �������� NVARCHAR(255),
    ������� NVARCHAR(255),
    �����_����� NVARCHAR(255),
    ��������� INT,
	������� NVARCHAR(255),
    ���_���������� NVARCHAR(255)
	)

	select * from Country

	select * from ����������_Isaev
	select*from ������_Isaev
	select*from �����_Isaev
	select*from ��������_Isaev

	1)
CREATE TABLE ����������_Isaev (
    ID INT PRIMARY KEY IDENTITY(1,1), 
    ��� VARCHAR(50) DEFAULT '' 
);
2)CREATE TABLE ������_Isaev (
    ID INT PRIMARY KEY,
    �������� VARCHAR(100) NOT NULL
);

3)
CREATE TABLE �����_Isaev (
	ID INT PRIMARY KEY,
	�������� VARCHAR(100) UNIQUE,
	����� VARCHAR(50) DEFAULT '����������'
);

4)
CREATE TABLE ��������_Isaev (
    ID INT PRIMARY KEY, 
    �������� VARCHAR(100) UNIQUE, 
    ����� VARCHAR(50) DEFAULT '������' 
);
