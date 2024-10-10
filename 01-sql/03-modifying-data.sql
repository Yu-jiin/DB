CREATE TABLE articles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    created_at DATE NOT NULL
);

-- 공통
SELECT * FROM articles;
DROP TABLE articles;
PRAGMA table_info('articles');


-- 1. Insert data into table
INSERT INTO articles (title, content, created_at)
VALUES ('제목1', '내용1', '2000-02-02');

INSERT INTO articles (title, content, created_at)
VALUES 
    ('제목2', '내용2', '2000-02-02'),
    ('제목3', '내용3', '2000-02-02'),
    ('제목4', '내용4', '2000-02-02');
    

-- 2. Update data in table
UPDATE articles
SET title = 'update title'
WHERE id = 1;

UPDATE articles
SET title = 'my title', content = 'my content'
WHERE id = 2;

-- 3. Delete data from table
DELETE FROM articles
WHERE id = 3;

-- 작성일이 오래된 순으로 레코드 두개 삭제
DELETE FROM articles
WHERE id IN(
    SELECT id FROM articles
    ORDER BY created_at
    LIMIT 2
);