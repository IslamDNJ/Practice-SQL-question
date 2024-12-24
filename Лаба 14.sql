CREATE DATABASE [Country - Lab 14];
USE [Country - Lab 14];
CREATE TABLE Worker (
    ID INT,
    Фамилия VARCHAR(50),
    Предмет VARCHAR(50),
    Школа VARCHAR(50),
    Баллы FLOAT
);

INSERT INTO Worker (ID, Фамилия, Предмет, Школа, Баллы)
VALUES
(1, 'Иванова', 'Математика', 'Лицей', 98.5),
(2, 'Петров', 'Физика', 'Лицей', 99),
(3, 'Сидоров', 'Математика', 'Лицей', 88),
(4, 'Полухина', 'Физика', 'Гимназия', 78),
(5, 'Матвеева', 'Химия', 'Лицей', 92),
(6, 'Касимов', 'Химия', 'Гимназия', 68),
(7, 'Нурулин', 'Математика', 'Гимназия', 81),
(8, 'Авдеев', 'Физика', 'Лицей', 87),
(9, 'Никитина', 'Химия', 'Лицей', 94);

/* 1 */
CREATE TRIGGER Trigger_Update_Ученики
AFTER UPDATE ON Worker
FOR EACH ROW
BEGIN
	-- Вывод
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Запись изменена';
END;

/* 2 */
-- Срабатывает после добавления
CREATE TRIGGER Trigger_Insert_Ученики
AFTER INSERT ON Worker
FOR EACH ROW
BEGIN
	-- Вывод
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Количество строк изменено';
END;

-- Срабатывает после удаления
CREATE TRIGGER Trigger_Delete_Ученики
AFTER DELETE ON Worker
FOR EACH ROW
BEGIN
	-- Вывод
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Количество строк изменено';
END;

/* 3 */
-- Срабатывает после добавления, изменения или удаления
CREATE TRIGGER Trigger_All_Ученики
AFTER INSERT OR UPDATE OR DELETE ON Worker
FOR EACH ROW
BEGIN
	-- Вывод
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = CONCAT(
        CURRENT_USER, ' изменил таблицу. Время: ', CURRENT_TIMESTAMP
    );
END;

/* 4 */
-- Срабатывает перед изменением записи
CREATE TRIGGER Trigger_Block_Update_Ученики
BEFORE UPDATE ON Worker
FOR EACH ROW
BEGIN
	-- Вывод - Запрещает изменение данных, выводя сообщение
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Нельзя редактировать данные';
END;

/* 5 */
-- Таблица для хранения данных об удаленных учениках, у которых есть однофамильцы
CREATE TABLE Ученики_{Ваша_фамилия} (
    Фамилия VARCHAR(50), -- Фамилия
    Дата_удаления DATETIME -- Дата и время удаления записи
);
-- Срабатывает после удаления записи
-- Проверяет, есть ли однофамильцы среди оставшихся записей, и если есть, фиксирует удаление
CREATE TRIGGER Trigger_Log_Delete_Ученики
AFTER DELETE ON Worker
FOR EACH ROW
BEGIN
    -- Если в таблице Worker остались однофамильцы, то записываем данные в таблицу Ученики_{УДЛ_фамилия}
    IF (SELECT COUNT(*) FROM Worker WHERE Фамилия = OLD.Фамилия) > 0 THEN
        INSERT INTO Ученики_{УДЛ_фамилия} (Фамилия, Дата_удаления)
        VALUES (OLD.Фамилия, NOW());
    END IF;
END;

/* 6 */
-- Удаление триггера Trigger_Log_Delete_Ученики
DROP TRIGGER IF EXISTS Trigger_Log_Delete_Ученики;

/* 7 */
-- Удаление всех созданных триггеров
DROP TRIGGER IF EXISTS Trigger_Update_Ученики;
DROP TRIGGER IF EXISTS Trigger_Insert_Ученики;
DROP TRIGGER IF EXISTS Trigger_Delete_Ученики;
DROP TRIGGER IF EXISTS Trigger_All_Ученики;
DROP TRIGGER IF EXISTS Trigger_Block_Update_Ученики;
DROP TRIGGER IF EXISTS Trigger_Log_Delete_Ученики;
