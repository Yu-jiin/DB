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

-- DISTINCT - 중복제거
SELECT DISTINCT Country
FROM customers
ORDER BY Country;

-- WHERE - 검색 조건 지정
SELECT LastName, FirstName, City
FROM customers
WHERE "City" = 'Prague';

SELECT LastName, FirstName, City
FROM customers
WHERE "City" != 'Prague';

SELECT LastName, FirstName, Company, Country
FROM customers
WHERE Company is NULL and "Country" = 'USA';

SELECT LastName, FirstName, Company, Country
FROM customers
WHERE Company is NULL OR "Country" = 'USA';

SELECT Name, Bytes
FROM tracks
WHERE "Bytes" BETWEEN 100000 AND 500000;

SELECT Name, Bytes
FROM tracks
WHERE "Bytes" BETWEEN 100000 AND 500000
ORDER BY "Bytes";

SELECT LastName, FirstName, Country
FROM customers
WHERE Country IN ('Canada', 'Germany', 'France');

SELECT LastName, FirstName, Country
FROM customers
WHERE Country NOT IN ('Canada', 'Germany', 'France');

SELECT LastName, FirstName
FROM customers
WHERE "LastName" LIKE '%son';

SELECT LastName, FirstName
FROM customers
WHERE "FirstName" LIKE '___a';

SELECT TrackID, Name, Bytes
FROM tracks
ORDER BY "Bytes" DESC
LIMIT 7;

# 4번째 부터 7번째 데이터만 조회
--  LIMIT 3, 4

-- 04. Grouping data 

-- 중복제거에 정렬까즤 ..
SELECT Country, count(*)
FROM customers
GROUP BY "Country";

SELECT Composer, AVG(Bytes)
FROM tracks
GROUP BY "Composer"
ORDER BY AVG("Bytes") DESC;