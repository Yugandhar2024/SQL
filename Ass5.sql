SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE ;
WHERE 
     *
ERROR at line 3:
ORA-00936: missing expression 


SQL> SELECT
  2  * FROM EMP;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20               
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

14 rows selected.

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE SAL>ALL(SELECT SAL
  4                FROM EMP
  5                WHERE JOB='SALESMAN');

ENAME                                                                                               
----------                                                                                          
JONES                                                                                               
BLAKE                                                                                               
CLARK                                                                                               
SCOTT                                                                                               
KING                                                                                                
FORD                                                                                                

6 rows selected.

SQL> SELECT *
  2  FROM EMP
  3  WHERE HIREDATE>ALL(SELECT HIREDATE
  4                     FROM EMP
  5                     WHERE JOB='CLERK');

no rows selected

SQL> SELECT ENAME,SAL
  2  FROM EMP
  3  WHERE SAL<ANY(SELECT SAL
  4                FROM EMP
  5                WHERE JOB='MANAGER');

ENAME             SAL                                                                               
---------- ----------                                                                               
SMITH             800                                                                               
JAMES             950                                                                               
ADAMS            1100                                                                               
WARD             1250                                                                               
MARTIN           1250                                                                               
MILLER           1300                                                                               
TURNER           1500                                                                               
ALLEN            1600                                                                               
CLARK            2450                                                                               
BLAKE            2850                                                                               

10 rows selected.

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE HIREDATE<ALL(SELECT HIREDATE
  4                     FROM EMP
  5                     WHERE JOB='MANAGER');

ENAME                                                                                               
----------                                                                                          
SMITH                                                                                               
ALLEN                                                                                               
WARD                                                                                                

SQL> ED
Wrote file afiedt.buf

  1  SELECT ENAME,HIREDATE
  2  FROM EMP
  3  WHERE HIREDATE<ALL(SELECT HIREDATE
  4                     FROM EMP
  5*                    WHERE JOB='MANAGER')
SQL> /

ENAME      HIREDATE                                                                                 
---------- ---------                                                                                
SMITH      17-DEC-80                                                                                
ALLEN      20-FEB-81                                                                                
WARD       22-FEB-81                                                                                

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE HIREDATE>ALL(SELECT HIREDATE
  4                     FROM EMP
  5                     WHERE JOB='MANAGER')
  6  AND SAL>ALL(SELECT SAL
  7              FROM EMP
  8              WHERE JOB='CLERK');

ENAME                                                                                               
----------                                                                                          
SCOTT                                                                                               
KING                                                                                                
TURNER                                                                                              
FORD                                                                                                

SQL> SELECT *
  2  FROM EMP
  3  WHERE JOB='CLERK'AND HIREDATE<ANY
  4  (SELECT HIREDATE
  5  FROM EMP
  6  WHERE JOB='SALESMAN');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20               

SQL> SELECT *
  2  FROM EMP
  3  WHERE DEPTNO IN
  4        (SELECT DEPTNO
  5         FROM DEPT
  6         WHERE DNAME IN('ACCOUNTING','SALES');
       WHERE DNAME IN('ACCOUNTING','SALES')
                                          *
ERROR at line 6:
ORA-00907: missing right parenthesis 


SQL> ED
Wrote file afiedt.buf

  1  SELECT *
  2  FROM EMP
  3  WHERE DEPTNO IN
  4        (SELECT DEPTNO
  5         FROM DEPT
  6*        WHERE DNAME IN('ACCOUNTING','SALES'))
SQL> ED
Wrote file afiedt.buf

  1  SELECT *
  2  FROM EMP
  3  WHERE DEPTNO IN
  4        (SELECT DEPTNO
  5         FROM DEPT
  6*        WHERE DNAME IN('ACCOUNTING','SALES'))
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30               
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10               
      7839 KING       PRESIDENT            17-NOV-81       5000                    10               
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30               
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30               
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10               

9 rows selected.

SQL> SELECT DNAME
  2  FROM DEPT
  3  WHERE DEPTNO IN
  4        (SELECT DEPTNO
  5         FROM EMP
  6         WHERE ENAME IN('SMITH','KING','MILLER'));

DNAME                                                                                               
--------------                                                                                      
ACCOUNTING                                                                                          
RESEARCH                                                                                            

SQL> SELECT *
  2  FROM EMP
  3  WHERE DEPTNO IN
  4        (SELECT DEPTNO
  5         WHERE LOC IN('NEW YORK','CHICAGO'));
       WHERE LOC IN('NEW YORK','CHICAGO'))
       *
ERROR at line 5:
ORA-00923: FROM keyword not found where expected 


SQL> ED
Wrote file afiedt.buf

  1  SELECT *
  2  FROM EMP
  3  WHERE DEPTNO IN
  4        (SELECT DEPTNO
  5         FROM DEPT
  6*        WHERE LOC IN('NEW YORK','CHICAGO'))
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30               
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10               
      7839 KING       PRESIDENT            17-NOV-81       5000                    10               
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30               
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30               
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10               

9 rows selected.

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE HIREDATE>ALL(
  4        SELECT HIREDATE
  5        FROM EMP
  6        WHERE DEPTNO=10);

ENAME                                                                                               
----------                                                                                          
SCOTT                                                                                               
ADAMS                                                                                               

SQL> SELECT ENAME
  2  FROM EMP
  3  ;

ENAME                                                                                               
----------                                                                                          
SMITH                                                                                               
ALLEN                                                                                               
WARD                                                                                                
JONES                                                                                               
MARTIN                                                                                              
BLAKE                                                                                               
CLARK                                                                                               
SCOTT                                                                                               
KING                                                                                                
TURNER                                                                                              
ADAMS                                                                                               
JAMES                                                                                               
FORD                                                                                                
MILLER                                                                                              

14 rows selected.

SQL> SPOOL OFF
