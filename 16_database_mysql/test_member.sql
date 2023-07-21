-- 실행 명령문 선택 후 , alt + x    or	alr + c
show databases;

USE digital_jsp;
-- 테이블 목록 확인
show tables;

DROP TABLE IF EXISTS member;

CREATE TABLE IF NOT EXISTS member(
	num INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50),
	addr VARCHAR(300)
);

DESC member;
DESCRIBE member;


/*
 *		INSERT		SELECT		UPDATE		DELETE
 *		Create		Read		Update		Delete 
 */
SELECT * FROM member;
INSERT INTO member(name,addr) VALUES('홍길동','한양');
