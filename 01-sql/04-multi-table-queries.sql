-- Active: 1728539230878@@127.0.0.1@3306
-- 공통
SELECT * FROM articles;
SELECT * FROM users;
DROP TABLE articles;
DROP TABLE users;
PRAGMA table_info('articles');


-- 실습용 데이터
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE articles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(50) NOT NULL,
  content VARCHAR(100) NOT NULL,
  userId INTEGER NOT NULL,
  FOREIGN KEY (userId) 
    -- userID 외래키는 users 테이블의 id를 참조 
    REFERENCES users(id)
);

INSERT INTO 
  users (name)
VALUES 
  ('하석주'),
  ('송윤미'),
  ('유하선');

INSERT INTO
  articles (title, content, userId)
VALUES 
  ('제목1', '내용1', 1),
  ('제목2', '내용2', 2),
  ('제목3', '내용3', 1),
  ('제목4', '내용4', 4),
  ('제목5', '내용5', 1);


-- INNER JOIN
SELECT * 
FROM articles
INNER JOIN users
  ON users.id = articles.userID;


-- 하석주가 작성한 게시글 
SELECT * 
FROM articles
INNER JOIN users
  ON users.id = articles.userID
WHERE users.name = '하석주';

-- LEFT JOIN
SELECT *
FROM articles
LEFT JOIN users
  ON users.id = articles."userId";