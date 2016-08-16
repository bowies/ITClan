CREATE TABLE OneByOne (
       OneByOneNum          NUMBER(10) NOT NULL,
       Content              VARCHAR(4000) NOT NULL,
       Mail                 VARCHAR(50) NULL,
       Title                VARCHAR(100) NULL,
       Filename             VARCHAR(20) NULL,
       ID                   VARCHAR(50) NULL,
       Name					VARCHAR(50)	 NULL,
       viewcnt				NUMBER(5)     DEFAULT 0,
       Regdate				DATE          NOT NULL,
       grpnum   NUMBER(7)     DEFAULT 0, -- 부모글 번호 
 	   indent  NUMBER(3)     DEFAULT 0, -- 답변여부,답변의 깊이(답변인가? 답변의 답변인가?)
  	   ansnum  NUMBER(5)     DEFAULT 0, -- 답변 순서 
       PRIMARY KEY (OneByOneNum)
);


 ALTER TABLE QnA MODIFY(Name VARCHAR(50) NULL);



CREATE TABLE QnA (
       QnANum               NUMBER(10) NOT NULL,
       Title                VARCHAR(100) NULL,
       Content              VARCHAR(4000) NULL,
       Name					VARCHAR(50)		NOT NULL,
       Regdate				DATE          NOT NULL,
       PRIMARY KEY (QnANum)
);

select * from ONEBYONE
select * from QNA

UPDATE ONEBYONE 
SET viewcnt = viewcnt + 1 
WHERE OneByOneNum=4; 
 
select * from onebyone
where OneByOneNum = 3
 
========  create  =======


INSERT INTO OneByOne(OneByOneNum, ID, Mail, name, Title, Content,Filename,regdate,grpnum)  
VALUES((SELECT NVL(MAX(OneByOneNum), 0) + 1 as OneByOneNum FROM OneByOne), 
'id005', 'id005@mail.com','이름5','제목', '내용','f.txt',sysdate,
(SELECT NVL(MAX(grpnum), 0) + 1  as grpnum FROM OneByOne));    

INSERT INTO OneByOne(OneByOneNum, ID, Mail,name, Title, Content,Filename,regdate,grpnum)  
VALUES((SELECT NVL(MAX(OneByOneNum), 0) + 1 as OneByOneNum FROM OneByOne), 
'id006', 'id006@mail.com','이름6','제목2', '내용2','ffff.txt',sysdate,
(SELECT NVL(MAX(grpnum), 0) + 1  as grpnum FROM OneByOne));   

INSERT INTO OneByOne(OneByOneNum, ID, Mail,name, Title, Content,Filename,regdate,grpnum)  
VALUES((SELECT NVL(MAX(OneByOneNum), 0) + 1 as OneByOneNum FROM OneByOne), 
'id007', 'id007@mail.com','이름7','제목3', '내용3','gggg.txt',sysdate,
(SELECT NVL(MAX(grpnum), 0) + 1  as grpnum FROM OneByOne));   

insert into QnA(qnANum , title, content,name, regdate)
values((SELECT NVL(MAX(QnANum), 0) + 1 as QnANum FROM QnA),
'제목6','내용6','작성자6',sysdate);

insert into QnA(QnANum , title, content,name, regdate)
values((SELECT NVL(MAX(QnANum), 0) + 1 as QnANum FROM QnA),
'제목3','내용3','작성자2',sysdate);
insert into QnA(QnANum , title, content,name, regdate)
values((SELECT NVL(MAX(QnANum), 0) + 1 as QnANum FROM QnA),
'제목2','내용2','작성자2',sysdate);

insert into QnA(QnANum , title, content,name, regdate)
values((SELECT NVL(MAX(QnANum), 0) + 1 as QnANum FROM QnA),
'제목1','내용1','작성자2',sysdate);
========  list   ==========
SELECT OneByOneNum, id, Mail, title,content, regdate , r 
from(
	SELECT OneByOneNum, id, Mail, title,content, regdate,  rownum r 
	from(	
		SELECT OneByOneNum, id, Mail, title,content,regdate
		FROM OneByOne  
		ORDER BY OneByOneNum
	)
)
where r >= 1 and r <= 5


SELECT QnANum, title, content,name ,regdate ,  r 
from(
	SELECT QnANum, title, content,name, regdate,   rownum r 
	from(	
		SELECT QnANum, title, content,name, regdate
		FROM QnA  
		ORDER BY QnANum
	)
)
where r >= 1 and r <= 5



======== read =======
SELECT OneByOneNum, id, Mail,title, content, filename, regdate
 FROM OneByOne
 WHERE OneByOneNum = 1

 select * from OneByOne

SELECT QnANum, title, content,name ,regdate 
 FROM QnA
 WHERE QnANum = 1

========= UPDATE  ==========
UPDATE OneByOne
SET title='제목수정', content='내용수정' 
WHERE OneByOneNum = 1; 

UPDATE OneByOne
SET ansnum=1, indent=1
WHERE OneByOneNum = 6; 



UPDATE QnA
SET title='제목수정', content='내용수정' 
WHERE QnANum = 1; 


======= DELETE  =============
DELETE FROM OneByOne WHERE OneByOneNum=1; 
DELETE FROM QnA WHERE QnANum=1; 


========= total ==========
SELECT QnANum, title, content,name, regdate
FROM QnA 
ORDER BY QnANum DESC; 


SELECT OneByOneNum, id, Mail, title,content,regdate
FROM OneByOne 
ORDER BY OneByOneNum DESC; 



drop table QnA
drop table OneByOne

