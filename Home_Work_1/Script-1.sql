--Задание №1: Уникальные страны клиентов
--Определите, сколько уникальных стран представлено среди клиентов.


SELECT COUNT(DISTINCT Country) AS counter FROM Customers;

--21
---------------------------------------------------------------------
--Задание №2: Клиенты из Бразилии
--Определите количество клиентов, которые проживают в Бразилии.

SELECT COUNT(Country) as Country_Brazil FROM Customers
WHERE Country = 'Brazil';

--9
----------------------------------------------------------------------
--Задание №3: Средняя цена и количество товаров в категории 5
--Посчитайте среднюю цену и общее количество товаров в категории с
--идентификатором 5.

SELECT 
	AVG(Price) AS avg_price,
	COUNT(*) AS count_product
FROM Products
WHERE CategoryID = 5;

--20,25
--7
----------------------------------------------------------------------
--Задание №4: Средний возраст сотрудников на 2024-01-01
--Вычислите средний возраст сотрудников на дату 2024-01-01.

--ALTER TABLE Employees
--RENAME TO Employees_old;

--CREATE TABLE Employees (
    --EmployeeID,
    --FirstName,
    --BirthDate DATE,
    --Photo,
    --Notes
    -- другие столбцы
--);

--INSERT INTO Employees (EmployeeID, FirstName, BirthDate, Photo, Notes)
--SELECT EmployeeID, FirstName, 
       --CASE 
           --WHEN BirthDate IS NOT NULL THEN DATE(BirthDate) 
           --ELSE NULL 
      -- END, 
      -- Photo, 
       --Notes
--FROM Employees_old;
--SELECT * FROM Employees;
--DROP TABLE Employees_old;

SELECT AVG((julianday('2024-01-01') - julianday(BirthDate)) / 365.25) AS AverageAge
FROM Employees
WHERE BirthDate IS NOT NULL;

-- 66 лет

--Задание №5: Заказы в период 30 дней до 2024-02-15
--Найдите заказы, сделанные в период с 16 января по 15 февраля 2024 года, и
--отсортируйте их по дате заказа.
--Подсказка: Используйте оператор BETWEEN для определения диапазона дат

SELECT *
FROM Orders
WHERE OrderDate BETWEEN '2024-01-16' AND '2024-02-15'
ORDER BY OrderDate;

--Задание №6: Количество заказов за ноябрь 2023 года (используя
--начальную и конечную дату)
--Определите количество заказов, сделанных в ноябре 2023 года, используя
--начальную и конечную дату месяца.
--Подсказка: Укажите точные даты начала и конца месяца в условии WHERE.

SELECT COUNT(OrderDate) AS заказы_за_ноябрь_2023_года
FROM Orders
WHERE OrderDate BETWEEN '2023-11-01' AND '2023-11-30';

--25

--Задание №7: Количество заказов за январь 2024 года (используя LIKE)
--Найдите количество заказов за январь 2024 года, используя оператор LIKE для
--фильтрации даты.
--Подсказка: Преобразуйте дату в текстовый формат и используйте шаблон LIKE для
--поиска по месяцу.

SELECT COUNT(*) AS january_orders
FROM Orders
WHERE OrderDate LIKE '2024-01%';

--33

--Задание №8: Количество заказов за 2024 год
--Определите количество заказов за 2024 года, используя функцию STRFTIME для
--извлечения года.
--Примечание: STRFTIME — это функция в SQLite, используемая для форматирования
--даты и времени. Она позволяет извлекать части даты и времени в нужном формате.
--Подсказка: Используйте STRFTIME для получения года и месяца из даты заказа.

SELECT COUNT(*) AS OrderCount
FROM Orders
WHERE STRFTIME('%Y', OrderDate) = '2024';

--44







