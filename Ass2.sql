SQL> SELECT DEPTNO,COUNT(*)
  2  FROM EMP
  3  WHERE JOB='CLERK'
  4  GROUP BY DEPTNO
  5  HAVING COUNT(*)>2;

no rows selected

SQL> ED
Wrote file afiedt.buf

  1  SELECT DEPTNO,COUNT(*)
  2  FROM EMP
  3  WHERE JOB='CLERK'
  4  GROUP BY DEPTNO
  5* HAVING COUNT(*)>=2
SQL> /

    DEPTNO   COUNT(*)                                                                               
---------- ----------                                                                               
        20          2                                                                               

SQL> SELECT DEPTNO,COUNT(*)
  2  FROM EMP
  3  GROUP BY DEPTNO
  4  HAVING COUNT(*)>3;

    DEPTNO   COUNT(*)                                                                               
---------- ----------                                                                               
        30          6                                                                               
        20          5                                                                               

SQL> SELECT JOB,COUNT(*)
  2  FROM EMP
  3  WHERE SAL>1200
  4  GROUP BY JOB
  5  HAVING SUM(SAL)>3800;

JOB         COUNT(*)                                                                                
--------- ----------                                                                                
SALESMAN           4                                                                                
PRESIDENT          1                                                                                
MANAGER            3                                                                                
ANALYST            2                                                                                

SQL> SELECT DEPTNO,COUNT(*) AS NO_OF_EMP
  2  FROM EMP
  3  GROUP BY DEPTNO
  4  HAVING  COUNT(CASE WHEN JOB='MANAGER' THEN 1 END)=2;

no rows selected

SQL> SELECT JOB,MAX(SAL)
  2  FROM EMP
  3  GROUP BY JOB
  4  HAVING MAX(SAL)>2600;

JOB         MAX(SAL)                                                                                
--------- ----------                                                                                
PRESIDENT       5000                                                                                
MANAGER         2975                                                                                
ANALYST         3000                                                                                

SQL> SELECT SAL
  2  FROM EMP
  3  GROUP BY SAL
  4  HAVING COUNT(SAL)>1;

       SAL                                                                                          
----------                                                                                          
      1250                                                                                          
      3000                                                                                          

SQL> SELECT HIREDATE
  2  FROM EMP
  3  GROUP BY HIREDATE
  4  HAVING COUNT(HIREDATE)>1;

HIREDATE                                                                                            
---------                                                                                           
03-DEC-81                                                                                           

SQL> SELECT DEPTNO,AVG(SAL)
  2  FROM EMP
  3  GROUP DEPTNO
  4  HAVING AVG(SAL)<3000
  5  ;
GROUP DEPTNO
      *
ERROR at line 3:
ORA-00924: missing BY keyword 


SQL> ED
Wrote file afiedt.buf

  1  SELECT DEPTNO,AVG(SAL)
  2  FROM EMP
  3  GROUP  BY DEPTNO
  4* HAVING AVG(SAL)<3000
  5  /

    DEPTNO   AVG(SAL)                                                                               
---------- ----------                                                                               
        30 1566.66667                                                                               
        20       2175                                                                               
        10 2916.66667                                                                               

SQL> SELECT DEPTNO
  2  FROM EMP
  3  WHERE ENAME LIKE '%A%' OR ENAME LIKE '%S%'
  4  GROUP BY DEPTNO
  5  HAVING COUNT(*)>=3;

    DEPTNO                                                                                          
----------                                                                                          
        30                                                                                          
        20                                                                                          

SQL> SELECT JOB,MIN(SAL),MAX(SAL)
  2  FROM
  3  GROUP BY JOB
  4  HAVING MIN(SAL)>1000 AND MAX(SAL)<5000;
GROUP BY JOB
*
ERROR at line 3:
ORA-00903: invalid table name 


SQL> ED
Wrote file afiedt.buf

  1  SELECT JOB,MIN(SAL),MAX(SAL)
  2  FROM EMP
  3  GROUP BY JOB
  4* HAVING MIN(SAL)>1000 AND MAX(SAL)<5000
SQL> /

JOB         MIN(SAL)   MAX(SAL)                                                                     
--------- ---------- ----------                                                                     
SALESMAN        1250       1600                                                                     
MANAGER         2450       2975                                                                     
ANALYST         3000       3000                                                                     

SQL> SPOOL OFF
