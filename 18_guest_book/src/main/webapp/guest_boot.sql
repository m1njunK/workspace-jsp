show tables;

CREATE TABLE test_guestbook(
	id INT PRIMARY KEY auto_increment, -- 방명록 글 번호
	guestName VARCHAR(20) NOT NULL,    -- 방명록 작성자
	password VARCHAR(30) NOT NULL,     -- 방명록 비밀번호
	message TEXT					   -- 방명록 글	
);

DESC test_guestbook;

SELECT*FROM test_guestbook;


