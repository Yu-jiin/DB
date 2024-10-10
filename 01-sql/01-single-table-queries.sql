-- Active: 1728520736769@@127.0.0.1@3306
-- 01. Querying data
SELECT LastName FROM employees;

SELECT LastName, FirstName FROM employees;

-- 전체 필드 조회
SELECT * from employees;

-- 필드 이름 바꾸기
SELECT FirstName AS '이름' FROM employees;

SELECT Name, Milliseconds / 60000 AS '재생 시간(분)' From tracks;

-- 02. Sorting data
SELECT FirstName from employees ORDER BY "FirstName" DESC;

SELECT Country, City FROM customers ORDER BY Country DESC, City ASC;

SELECT Name, Milliseconds / 60000 AS '재생 시간(분)'
FROM tracks
ORDER BY Milliseconds DESC;


-- NULL 정렬 예시
SELECT ReportsTo
FROM employees
ORDER BY ReportsTo;

-- 03. Filtering data

-- 04. Grouping data 

