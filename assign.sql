SQL> SELECT COUNT(*),DEPTNO
  2  FROM EMP
  3  WHERE SAL<2000 AND DEPTNO=10;
SELECT COUNT(*),DEPTNO
                *
ERROR at line 1:
ORA-00937: not a single-group group function 


SQL> ED
Wrote file afiedt.buf

  1  SELECT COUNT(*)
  2  FROM EMP
  3* WHERE SAL<2000 AND DEPTNO=10
SQL> /

  COUNT(*)                                                                                          
----------                                                                                          
         1                                                                                          

SQL> SELECT * FROM EMP;

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

SQL> SELECT SUM(SAL)
  2  FROM EMP
  3  WHERE JOB='CLERK';

  SUM(SAL)                                                                                          
----------                                                                                          
      4150                                                                                          

SQL> SELECT AVG(SAL)
  2  FROM EMP;

  AVG(SAL)                                                                                          
----------                                                                                          
2073.21429                                                                                          

SQL> SELECT COUNT(*)
  2  FROM EMP
  3  WHERE ENAME LIKE ('A%');

  COUNT(*)                                                                                          
----------                                                                                          
         2                                                                                          

SQL> SELECT COUNT(*)
  2  FROM EMP
  3  WHERE JOB IN('CLERK','MANAGER');

  COUNT(*)                                                                                          
----------                                                                                          
         7                                                                                          

SQL> SELECT COUNT(*)
  2  FROM EMP
  3  WHERE TO_CHAR(HIREDATE,'MON')='FEB';

  COUNT(*)                                                                                          
----------                                                                                          
         2                                                                                          

SQL> SELECT COUNT(*)
  2  FROM EMP
  3  WHERE MGR=7839;

  COUNT(*)                                                                                          
----------                                                                                          
         3                                                                                          

SQL> SELECT COUNT(*)
  2  FROM EMP
  3  WHERE DEPTNO=30 AND COMM IS NOT NULL;

  COUNT(*)                                                                                          
----------                                                                                          
         4                                                                                          

SQL> SELECT COUNT(*),AVG(SAL),SUM(SAL),MAX(SAL)
  2  FROM EMP
  3  WHERE JOB='PRESIDENT';

  COUNT(*)   AVG(SAL)   SUM(SAL)   MAX(SAL)                                                         
---------- ---------- ---------- ----------                                                         
         1       5000       5000       5000                                                         

SQL> SELECT COUNT(*)
  2  FROM EMP
  3  WHERE ENAME LIKE '%A%';

  COUNT(*)                                                                                          
----------                                                                                          
         7                                                                                          

SQL> SELECT COUNT(*)
  2  FROM EMP
  3  WHERE ENAME LIKE '%Z%';

  COUNT(*)                                                                                          
----------                                                                                          
         0                                                                                          

SQL> SELECT COUNT
  2  (*),SUM(SAL)
  3  FROM EMP
  4  WHERE ENAME LIKE '%LL%';

  COUNT(*)   SUM(SAL)                                                                               
---------- ----------                                                                               
         2       2900                                                                               

SQL> SELECT COUNT(DISTINCT DEPTNO)
  2  FROM EMP;

COUNT(DISTINCTDEPTNO)                                                                               
---------------------                                                                               
                    3                                                                               

SQL> SELECT COUNT(*)
  2  FROM EMP
  3  WHERE ENAME LIKE '%$%';

  COUNT(*)                                                                                          
----------                                                                                          
         0                                                                                          

SQL> SELECT SUM(SAL)
  2  FROM EMP
  3  WHERE JOB='CLERK' AND DEPTNO=30;

  SUM(SAL)                                                                                          
----------                                                                                          
       950                                                                                          

SQL> SELECT MAX(SAL)
  2  FROM EMP
  3  WHERE JOB='ANALYST';

  MAX(SAL)                                                                                          
----------                                                                                          
      3000                                                                                          

SQL> SELECT COUNT(DISTINCT SAL)
  2  FROM EMP;

COUNT(DISTINCTSAL)                                                                                  
------------------                                                                                  
                12                                                                                  

SQL> SELECT COUNT(DISTINCT JOB)
  2  FROM EMP;

COUNT(DISTINCTJOB)                                                                                  
------------------                                                                                  
                 5                                                                                  

SQL> SELECT AVG(SAL)
  2  FROM EMP
  3  WHERE JOB='CLERK';

  AVG(SAL)                                                                                          
----------                                                                                          
    1037.5                                                                                          

SQL> SELECT MIN(SAL)
  2  FROM EMP
  3  WHERE DEPTNO=10 AND (JOB='MANAGER' OR JOB='CLERK');

  MIN(SAL)                                                                                          
----------                                                                                          
      1300                                                                                          

SQL> SPOOL OFF
