CREATE DATABASE [Country - Lab 14];
USE [Country - Lab 14];
CREATE TABLE Worker (
    ID INT,
    ������� VARCHAR(50),
    ������� VARCHAR(50),
    ����� VARCHAR(50),
    ����� FLOAT
);

INSERT INTO Worker (ID, �������, �������, �����, �����)
VALUES
(1, '�������', '����������', '�����', 98.5),
(2, '������', '������', '�����', 99),
(3, '�������', '����������', '�����', 88),
(4, '��������', '������', '��������', 78),
(5, '��������', '�����', '�����', 92),
(6, '�������', '�����', '��������', 68),
(7, '�������', '����������', '��������', 81),
(8, '������', '������', '�����', 87),
(9, '��������', '�����', '�����', 94);

/* 1 */
CREATE TRIGGER Trigger_Update_�������
AFTER UPDATE ON Worker
FOR EACH ROW
BEGIN
	-- �����
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '������ ��������';
END;

/* 2 */
-- ����������� ����� ����������
CREATE TRIGGER Trigger_Insert_�������
AFTER INSERT ON Worker
FOR EACH ROW
BEGIN
	-- �����
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '���������� ����� ��������';
END;

-- ����������� ����� ��������
CREATE TRIGGER Trigger_Delete_�������
AFTER DELETE ON Worker
FOR EACH ROW
BEGIN
	-- �����
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '���������� ����� ��������';
END;

/* 3 */
-- ����������� ����� ����������, ��������� ��� ��������
CREATE TRIGGER Trigger_All_�������
AFTER INSERT OR UPDATE OR DELETE ON Worker
FOR EACH ROW
BEGIN
	-- �����
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = CONCAT(
        CURRENT_USER, ' ������� �������. �����: ', CURRENT_TIMESTAMP
    );
END;

/* 4 */
-- ����������� ����� ���������� ������
CREATE TRIGGER Trigger_Block_Update_�������
BEFORE UPDATE ON Worker
FOR EACH ROW
BEGIN
	-- ����� - ��������� ��������� ������, ������ ���������
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '������ ������������� ������';
END;

/* 5 */
-- ������� ��� �������� ������ �� ��������� ��������, � ������� ���� ������������
CREATE TABLE �������_{����_�������} (
    ������� VARCHAR(50), -- �������
    ����_�������� DATETIME -- ���� � ����� �������� ������
);
-- ����������� ����� �������� ������
-- ���������, ���� �� ������������ ����� ���������� �������, � ���� ����, ��������� ��������
CREATE TRIGGER Trigger_Log_Delete_�������
AFTER DELETE ON Worker
FOR EACH ROW
BEGIN
    -- ���� � ������� Worker �������� ������������, �� ���������� ������ � ������� �������_{���_�������}
    IF (SELECT COUNT(*) FROM Worker WHERE ������� = OLD.�������) > 0 THEN
        INSERT INTO �������_{���_�������} (�������, ����_��������)
        VALUES (OLD.�������, NOW());
    END IF;
END;

/* 6 */
-- �������� �������� Trigger_Log_Delete_�������
DROP TRIGGER IF EXISTS Trigger_Log_Delete_�������;

/* 7 */
-- �������� ���� ��������� ���������
DROP TRIGGER IF EXISTS Trigger_Update_�������;
DROP TRIGGER IF EXISTS Trigger_Insert_�������;
DROP TRIGGER IF EXISTS Trigger_Delete_�������;
DROP TRIGGER IF EXISTS Trigger_All_�������;
DROP TRIGGER IF EXISTS Trigger_Block_Update_�������;
DROP TRIGGER IF EXISTS Trigger_Log_Delete_�������;
