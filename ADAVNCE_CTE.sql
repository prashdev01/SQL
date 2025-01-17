use joindb;

-- CTE Advance
-- find the average salary by departments using CTE

WITH DEPT_AVERAGE AS (
SELECT EMPNO, ENAME, DEPTNO, AVG(SAL) AS AVG_SAL
FROM emp
GROUP BY EMPNO, ENAME, DEPTNO
)

SELECT E.EMPNO,E.ENAME,E.AVG_SAL, D.DNAME FROM DEPT_AVERAGE E
LEFT JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

WITH RECURSIVE EMP_HIERARCHY AS (
SELECT EMPNO, ENAME, MGR, 0 AS LVL
FROM EMP
WHERE MGR IS NULL
UNION ALL
SELECT E.EMPNO, E.ENAME, E.MGR, EH.LVL + 1 AS LVL
FROM EMP E 
INNER JOIN EMP_HIERARCHY AS EH
ON E.MGR = EH.EMPNO
)
SELECT * FROM EMP_HIERARCHY
ORDER BY LVL,EMPNO;




SELECT * FROM EMP;
CREATE TABLE CAT_TBL (CATID INT NOT NULL, CATNAME VARCHAR(50) NOT NULL, PARENTCATID INT);

INSERT INTO CAT_TBL (CATID,CATNAME,PARENTCATID)
VALUES
(101,"ELECTRONICS", NULL),
(102,"COMPUTERS", 101),
(103,"LAPTOPS", 102),
(104,"DESKTOPS", 102),
(105,"ACCESESRIES", 101),
(106,"KEYBOARD", 105),
(107,"MOUSE", 105);

UPDATE CAT_TBL SET PARENTCATID = 101
WHERE CATID = 102;

WITH RECURSIVE CAT_HIERARCHY AS (
SELECT CATID, CATNAME,PARENTCATID, 0 AS LVL
from cat_tbl
WHERE PARENTCATID IS NULL
UNION ALL
SELECT C.CATID, C.CATNAME,C.PARENTCATID, CH.LVL + 1 AS LVL
FROM CAT_TBL C 
INNER JOIN CAT_HIERARCHY CH
ON C.PARENTCATID = CH.CATID
)
SELECT * FROM CAT_HIERARCHY
ORDER BY LVL, CATID;

CREATE TABLE FOLDER_FILE (ID INT NOT NULL, NAME VARCHAR(20) NOT NULL, TYPE VARCHAR(20) , PARENTID INT );

INSERT	INTO FOLDER_FILE (ID, NAME, TYPE, PARENTID)
VALUES
(1001,"ROOT", "FOLDER",NULL),
(1002,"DOCUMENTS", "FOLDER",1001),
(1003,"IMAGES", "FOLDER",1001),
(1004,"REPORTS.DOCX", "FILE",1002),
(1005,"RESUME.DOCX", "FILE",1002),
(1006,"INVOICE.XLSX", "FILE",1003),
(1007,"WORK.JPG", "FOLDER",1003),
(1008,"FAMILY.JPG", "FILE",1003),
(1009,"PROJECT.DOCX", "FILE",1008);

SELECT * FROM FOLDER_FILE;



