/* 
 	공지형 게시판 테이블
 */
CREATE TABLE IF NOT EXISTS notice_board(
	notice_num INT PRIMARY KEY AUTO_INCREMENT,	 -- 공지 번호
	notice_category VARCHAR(20) NOT NULL,		 -- 공지 분류
	notice_author VARCHAR(50)   NOT NULL,		 -- 작성자
	notice_title VARCHAR(50) NOT NULL,			 -- 제목
	notice_content TEXT NOT NULL,				 -- 내용
	notice_date TIMESTAMP DEFAULT now()			 -- 작성 시간
);

DESCRIBE notice_board;