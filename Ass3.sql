SQL> SELECT *
  2  FROM EMP
  3  WHERE SAL(SELECT SAL
  4  FROM EMP
  5  WHERE ENAME='SMITH');
WHERE SAL(SELECT SAL
          *
ERROR at line 3:
ORA-00936: missing expression 


SQL> ED
Wrote file afiedt.buf

  1  SELECT *
  2  FROM EMP
  3  WHERE SAL>(SELECT SAL
  4  FROM EMP
  5* WHERE ENAME='SMITH')
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30               
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20               
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10               
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20               
      7839 KING       PRESIDENT            17-NOV-81       5000                    10               
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30               
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20               
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30               
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20               
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10               

13 rows selected.

SQL> SELECT *
  2  FROM EMP
  3  WHERE JOB=(SELECT JOB
  4  FROM EMP
  5  WHERE ENAME='ALLEN');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30               
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30               
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30               

SQL> SELECT ENAME,SAL
  2  FROM EMP
  3  WHERE SAL>(SELECT SAL
  4  FROM EMP
  5  WHERE ENAME='KING');

no rows selected

SQL> SELECT ENAME,JOB FROM EMP
  2  WHERE JOB=(SELECT JOB
  3  FROM EMP
  4  WHERE ENAME='JAMES');

ENAME      JOB                                                                                      
---------- ---------                                                                                
SMITH      CLERK                                                                                    
ADAMS      CLERK                                                                                    
JAMES      CLERK                                                                                    
MILLER     CLERK                                                                                    

SQL> SELECT EMPNO,ENAME,SAL*12 AS ANNUAL_SALARY
  2  FROM EMP
  3  WHERE (SAL*12)>(SELECT SAL*12
  4  FROM EMP
  5  WHERE ENAME='WARD');

     EMPNO ENAME      ANNUAL_SALARY                                                                 
---------- ---------- -------------                                                                 
      7499 ALLEN              19200                                                                 
      7566 JONES              35700                                                                 
      7698 BLAKE              34200                                                                 
      7782 CLARK              29400                                                                 
      7788 SCOTT              36000                                                                 
      7839 KING               60000                                                                 
      7844 TURNER             18000                                                                 
      7902 FORD               36000                                                                 
      7934 MILLER             15600                                                                 

9 rows selected.

SQL> SELECT ENAME,HIREDATE
  2  FROM EMP
  3  WHERE HIREDATE<(SELECT HIREDATE
  4  FROM EMP
  5  WHERE ENAME='SCOTT');

ENAME      HIREDATE                                                                                 
---------- ---------                                                                                
SMITH      17-DEC-80                                                                                
ALLEN      20-FEB-81                                                                                
WARD       22-FEB-81                                                                                
JONES      02-APR-81                                                                                
MARTIN     28-SEP-81                                                                                
BLAKE      01-MAY-81                                                                                
CLARK      09-JUN-81                                                                                
KING       17-NOV-81                                                                                
TURNER     08-SEP-81                                                                                
JAMES      03-DEC-81                                                                                
FORD       03-DEC-81                                                                                
MILLER     23-JAN-82                                                                                

12 rows selected.

SQL> SELECT ENAME,HIREDATE
  2  FROM EMP
  3  WHERE HIREDATE<(SELECT HIREDATE
  4  FROM EMP
  5  WHERE ENAME=';
ERROR:
ORA-01756: quoted string not properly terminated 


SQL> ED
Wrote file afiedt.buf

  1  SELECT ENAME,HIREDATE
  2  FROM EMP
  3  WHERE HIREDATE<(SELECT HIREDATE
  4  FROM EMP
  5* WHERE ENAME='SCOTT');
SQL> /
WHERE ENAME='SCOTT');
                    *
ERROR at line 5:
ORA-00911: invalid character 


SQL> ED
Wrote file afiedt.buf

  1  SELECT ENAME,HIREDATE
  2  FROM EMP
  3  WHERE HIREDATE<(SELECT HIREDATE
  4  FROM EMP
  5* WHERE ENAME='SCOTT')
SQL> /

ENAME      HIREDATE                                                                                 
---------- ---------                                                                                
SMITH      17-DEC-80                                                                                
ALLEN      20-FEB-81                                                                                
WARD       22-FEB-81                                                                                
JONES      02-APR-81                                                                                
MARTIN     28-SEP-81                                                                                
BLAKE      01-MAY-81                                                                                
CLARK      09-JUN-81                                                                                
KING       17-NOV-81                                                                                
TURNER     08-SEP-81                                                                                
JAMES      03-DEC-81                                                                                
FORD       03-DEC-81                                                                                
MILLER     23-JAN-82                                                                                

12 rows selected.

SQL> SELECT ENAME,HIREDATE
  2  FROM EMP
  3  WHERE HIREDATE>(SELECT HIREDATE
  4  FROM EMP
  5  WHERE JOB='PRESIDENT');

ENAME      HIREDATE                                                                                 
---------- ---------                                                                                
SCOTT      19-APR-87                                                                                
ADAMS      23-MAY-87                                                                                
JAMES      03-DEC-81                                                                                
FORD       03-DEC-81                                                                                
MILLER     23-JAN-82                                                                                

SQL> SELECT ENAME,SAL
  2  FROM EMP
  3  WHERE SAL<(SELECT SAL
  4  FROM EMP
  5  WHERE EMPNO=7839);

ENAME             SAL                                                                               
---------- ----------                                                                               
SMITH             800                                                                               
ALLEN            1600                                                                               
WARD             1250                                                                               
JONES            2975                                                                               
MARTIN           1250                                                                               
BLAKE            2850                                                                               
CLARK            2450                                                                               
SCOTT            3000                                                                               
TURNER           1500                                                                               
ADAMS            1100                                                                               
JAMES             950                                                                               
FORD             3000                                                                               
MILLER           1300                                                                               

13 rows selected.

SQL> SELECT * FROM EMP
  2  WHERE HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME='MILLER');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30               
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20               
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10               
      7839 KING       PRESIDENT            17-NOV-81       5000                    10               
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30               
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30               
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20               

11 rows selected.

SQL> SELECT ENAME,EMPNO
  2  FROM EMP
  3  WHERE SAL(SELECT SAL FROM EMP
  4  WHERE ENAME='ALLEN');
WHERE SAL(SELECT SAL FROM EMP
          *
ERROR at line 3:
ORA-00936: missing expression 


SQL> ED
Wrote file afiedt.buf

  1  SELECT ENAME,EMPNO
  2  FROM EMP
  3  WHERE SAL>(SELECT SAL FROM EMP
  4* WHERE ENAME='ALLEN')
SQL> /

ENAME           EMPNO                                                                               
---------- ----------                                                                               
JONES            7566                                                                               
BLAKE            7698                                                                               
CLARK            7782                                                                               
SCOTT            7788                                                                               
KING             7839                                                                               
FORD             7902                                                                               

6 rows selected.

SQL> SELECT ENAME,SAL
  2  FROM EMP
  3  WHERE SAL>(SELECT SAL FROM EMP
  4  WHERE ENAME='MILLER'
  5  )
  6  AND SAL<(SELECT SAL FROM EMP
  7  WHERE ENAME='ALLEN');

ENAME             SAL                                                                               
---------- ----------                                                                               
TURNER           1500                                                                               

SQL> SELECT * FROM EMP
  2  WHERE DEPTNO=20
  3  AND JOB=(SELECT JOB FROM EMP
  4  WHERE ENAME='SMITH');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20               
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20               

SQL> SELECT *
  2  FROM EMP
  3  WHERE JOB='MANAGER' AND DEPTNO=(SELECT DEPTNO FROM EMP
  4  WHERE ENAME='TURNER');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               

SQL> SELECT ENAME,HIREDATE FROM EMP
  2  WHERE HIREDATE>'31-DEC-1980' AND HIREDATE<(SELECT HIREDATE
  3  FROM EMP
  4  WHERE ENAME='KING');

ENAME      HIREDATE                                                                                 
---------- ---------                                                                                
ALLEN      20-FEB-81                                                                                
WARD       22-FEB-81                                                                                
JONES      02-APR-81                                                                                
MARTIN     28-SEP-81                                                                                
BLAKE      01-MAY-81                                                                                
CLARK      09-JUN-81                                                                                
TURNER     08-SEP-81                                                                                

7 rows selected.

SQL> SELECT ENAME,SAL,SAL*12 AS ANNUAL_SALARY
  2  FROM EMP
  3  WHERE SAL<(SELECT SAL FROM EMP
  4  WHER ENAME='BLAKE' AND (SAL*12)>3500;
WHERE SAL<(SELECT SAL FROM EMP
           *
ERROR at line 3:
ORA-00921: unexpected end of SQL command 


SQL> ED
Wrote file afiedt.buf

  1  SELECT ENAME,SAL,SAL*12 AS ANNUAL_SALARY
  2  FROM EMP
  3  WHERE SAL<(SELECT SAL FROM EMP
  4* WHER ENAME='BLAKE' AND (SAL*12)>3500
SQL> SELECT * FROM EMP
  2  WHERE SAL>(SELECT *
  3  FROM EMP
  4  WHERE ENAME='SCOTT) AND
  5  SAL<(SELECT * FROM EMP
  6  WHERE ENAME='KING');
ERROR:
ORA-01756: quoted string not properly terminated 


SQL> ED
Wrote file afiedt.buf

  1  SELECT * FROM EMP
  2  WHERE SAL>(SELECT *
  3  FROM EMP
  4  WHERE ENAME='SCOTT') AND
  5  SAL<(SELECT * FROM EMP
  6* WHERE ENAME='KING')
SQL> /
WHERE SAL>(SELECT *
           *
ERROR at line 2:
ORA-00913: too many values 


SQL> ED
Wrote file afiedt.buf

  1  SELECT * FROM EMP
  2  WHERE SAL>(SELECT *
  3  FROM EMP
  4  WHERE ENAME='SCOTT') AND
  5  SAL<(SELECT * FROM EMP
  6* WHERE ENAME='KING')
SQL> /
WHERE SAL>(SELECT *
           *
ERROR at line 2:
ORA-00913: too many values 


SQL> SELECT *
  2  FROM emp
  3  WHERE sal > (
  4      SELECT sal
  5      FROM emp
  6      WHERE ename = 'SCOTT'
  7  )
  8  AND sal < (
  9      SELECT sal
 10      FROM emp
 11      WHERE ename = 'KING'
 12  );

no rows selected

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE ENAME LIKES 'A%' AND DEPTNO=(SELECT DEPTNO
  4  FROM EMP
  5  WHERE ENAME='BLAKE');
WHERE ENAME LIKES 'A%' AND DEPTNO=(SELECT DEPTNO
            *
ERROR at line 3:
ORA-00920: invalid relational operator 


SQL> SELECT *
  2  FROM emp
  3  WHERE ename LIKE 'A%'
  4  AND deptno = (
  5      SELECT deptno
  6      FROM emp
  7      WHERE ename = 'BLAKE'
  8  );

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               

SQL> SELECT ENAME,COMM
  2  FROM EMP
  3  WHERE JOB=(
  4      SELECT JOB
  5  FROM EMP
  6  WHERE ENAME='SMITH')
  7  AND COMM IS NOT NULL AND COMM>0;

no rows selected

SQL> SELECT * FROM EMP
  2  WHERE JOB='CLERK'
  3  AND DEPTNO=(
  4      SELECT DEPTNO
  5      FROM EMP
  6      WHERE ENAME='TUNER');

no rows selected

SQL> SELECT ENAME,SAL,JOB
  2  FROM EMP
  3  WHERE (SAL*12)>(
  4        SELECT SAL*12
  5        FROM EMP
  6        WHERE ENAME='SMITH')
  7        AND (SAL*12)<(SELECT SAL*12 FROM EMP
  8        WHERE ENAME='KING');

ENAME             SAL JOB                                                                           
---------- ---------- ---------                                                                     
ALLEN            1600 SALESMAN                                                                      
WARD             1250 SALESMAN                                                                      
JONES            2975 MANAGER                                                                       
MARTIN           1250 SALESMAN                                                                      
BLAKE            2850 MANAGER                                                                       
CLARK            2450 MANAGER                                                                       
SCOTT            3000 ANALYST                                                                       
TURNER           1500 SALESMAN                                                                      
ADAMS            1100 CLERK                                                                         
JAMES             950 CLERK                                                                         
FORD             3000 ANALYST                                                                       
MILLER           1300 CLERK                                                                         

12 rows selected.

SQL> SPOOL OFF
