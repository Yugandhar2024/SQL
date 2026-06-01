SQL> SELECT DNAME
  2  FROM DEPT
  3  WHERE DNO IN(SELECT DEPTNO
  4               FROM EMP
  5               WHERE ENAME='SMITH');
WHERE DNO IN(SELECT DEPTNO
      *
ERROR at line 3:
ORA-00904: "DNO": invalid identifier 


SQL> ED
Wrote file afiedt.buf

  1  SELECT DNAME
  2  FROM DEPT
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4               FROM EMP
  5*              WHERE ENAME='SMITH')
SQL> /

DNAME                                                                                               
--------------                                                                                      
RESEARCH                                                                                            

SQL> SELECT DNAME,LOC
  2  FROM DEPT
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4                  FROM EMP
  5                  WHERE ENAME='KING');

DNAME          LOC                                                                                  
-------------- -------------                                                                        
ACCOUNTING     NEW YORK                                                                             

SQL> SELECT LOC
  2  FROM DEPT
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4                  FROM EMP
  5                  WHERE EMPNO=7902);

LOC                                                                                                 
-------------                                                                                       
DALLAS                                                                                              

SQL> SELECT DNAME,LOC,DEPTNO
  2  FROM DEPT
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4                  FROM EMP
  5                  WHERE ENAME LIKE '%R');

DNAME          LOC               DEPTNO                                                             
-------------- ------------- ----------                                                             
ACCOUNTING     NEW YORK              10                                                             
SALES          CHICAGO               30                                                             

SQL> SELECT DNAME
  2  FROM DEPT
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4                  FROM EMP
  5                  WHERE JOB='PRESIDENT');

DNAME                                                                                               
--------------                                                                                      
ACCOUNTING                                                                                          

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4                  FROM DEPT
  5                  WHERE DNAME='ACCOUNTING');

ENAME                                                                                               
----------                                                                                          
CLARK                                                                                               
KING                                                                                                
MILLER                                                                                              

SQL> SELECT ENAME,SAL
  2  FROM EMP
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4                  FROM DEPT
  5                  WHERE LOC='CHICAGO');

ENAME             SAL                                                                               
---------- ----------                                                                               
ALLEN            1600                                                                               
WARD             1250                                                                               
MARTIN           1250                                                                               
BLAKE            2850                                                                               
TURNER           1500                                                                               
JAMES             950                                                                               

6 rows selected.

SQL> SELECT * FROM DEPT;

    DEPTNO DNAME          LOC                                                                       
---------- -------------- -------------                                                             
        10 ACCOUNTING     NEW YORK                                                                  
        20 RESEARCH       DALLAS                                                                    
        30 SALES          CHICAGO                                                                   
        40 OPERATIONS     BOSTON                                                                    

SQL> SELECT *
  2  FROM EMP
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4                  FROM DEPT
  5                  WHERE DNAME='SALES');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30               
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30               
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30               

6 rows selected.

SQL> SELECT EMP.*,SAL*12 AS ANNUAL_SALARY
  2  FROM EMP
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4                  FROM DEPT
  5                  WHERE LOC='NEW YORK');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO ANNUAL_SALARY 
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ------------- 
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         29400 
      7839 KING       PRESIDENT            17-NOV-81       5000                    10         60000 
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         15600 

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4                  FROM DEPT
  5                  WHERE DNAME='OPERATIONS');

no rows selected

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE SAL>(
  4             SELECT SAL
  5             FROM EMP
  6             WHERE ENAME='SCOTT'
  7             )
  8  AND DEPTNO IN(SELECT DEPTNO
  9                FROM DEPT
 10                WHERE DNAME='ACCOUNTING');

ENAME                                                                                               
----------                                                                                          
KING                                                                                                

SQL> SELECT *
  2  FROM EMP
  3  WHERE JOB='MANAGER'AND DEPTNO IN(SELECT DEPTNO
  4                                   FROM DEPT
  5                                   WHERE LOC='CHICAGO');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               

SQL> SELECT ENAME,SAL
  2  FROM EMP
  3  WHERE SAL>(SELECT SAL
  4             FROM EMP
  5             WHERE ENAME='KING')
  6  AND DEPTNO=(SELECT DEPTNO
  7              FROM DEPTNO
  8              WHERE DNAME='ACCOUNTING');
            FROM DEPTNO
                 *
ERROR at line 7:
ORA-00942: table or view does not exist 


SQL> ED
Wrote file afiedt.buf

  1  SELECT ENAME,SAL
  2  FROM EMP
  3  WHERE SAL>(SELECT SAL
  4             FROM EMP
  5             WHERE ENAME='KING')
  6  AND DEPTNO=(SELECT DEPTNO
  7              FROM DEPT
  8*             WHERE DNAME='ACCOUNTING')
SQL> /

no rows selected

SQL> SELECT ename, sal
  2  FROM emp
  3  WHERE sal > (
  4      SELECT sal
  5      FROM emp
  6      WHERE ename = 'KING'
  7  )
  8  AND deptno = (
  9      SELECT deptno
 10      FROM dept
 11      WHERE dname = 'ACCOUNTING'
 12  );

no rows selected

SQL> SELECT *
  2  FROM EMP
  3  WHERE JOB='SALESMAN' AND DEPTNO=(SELECT DEPTNO
  4                                   FROM DEPT
  5                                   WHERE DNAME='SALES');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30               
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30               
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30               

SQL> SELECT ENAME,SAL,JOB
  2  FROM EMP
  3  WHERE HIREDATE IN (SELECT DEPTNO
  4                     FROM DEPT
  5                     WHERE DNAME='OPERATIONS') AND HIREDATE > (SELECT DEPTNO
  6                                                               FROM EMP
  7                                                               WHERE ENAME='KING');
WHERE HIREDATE IN (SELECT DEPTNO
               *
ERROR at line 3:
ORA-00932: inconsistent datatypes: expected DATE got NUMBER 


SQL> ED
Wrote file afiedt.buf

  1  SELECT ENAME,SAL,JOB
  2  FROM EMP
  3  WHERE HIREDATE = (SELECT DEPTNO
  4                     FROM DEPT
  5                     WHERE DNAME='OPERATIONS') AND HIREDATE > (SELECT DEPTNO
  6                                                               FROM EMP
  7*                                                              WHERE ENAME='KING')
SQL> /
                   WHERE DNAME='OPERATIONS') AND HIREDATE > (SELECT DEPTNO
                                                          *
ERROR at line 5:
ORA-00932: inconsistent datatypes: expected DATE got NUMBER 


SQL> ED
Wrote file afiedt.buf

  1  SELECT ENAME,SAL,JOB,HIREDATE
  2  FROM EMP
  3  WHERE DEPTNO = (SELECT DEPTNO
  4                     FROM DEPT
  5                     WHERE DNAME='OPERATIONS') AND HIREDATE < (SELECT HIREDATE
  6                                                               FROM EMP
  7*                                                              WHERE ENAME='KING')
SQL> /

no rows selected

SQL> SELECT *
  2  FROM EMP
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4                  FROM DEPT
  5                  WHERE DNAME LIKE '%S');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30               
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30               
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30               

6 rows selected.

SQL> SELECT DNAME
  2  FROM DEPT
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4                  FROM EMP
  5                  WHERE ENAME LIKES '%A%');
                WHERE ENAME LIKES '%A%')
                            *
ERROR at line 5:
ORA-00920: invalid relational operator 


SQL> ED
Wrote file afiedt.buf

  1  SELECT DNAME
  2  FROM DEPT
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4                  FROM EMP
  5*                 WHERE ENAME LIKE '%A%')
SQL> /

DNAME                                                                                               
--------------                                                                                      
ACCOUNTING                                                                                          
RESEARCH                                                                                            
SALES                                                                                               

SQL> SELECT DNAME,LOC
  2  FROM DEPT
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4                  FROM EMP
  5                  WHERE SAL=800
  6                 );

DNAME          LOC                                                                                  
-------------- -------------                                                                        
RESEARCH       DALLAS                                                                               

SQL> SELECT DNAME
  2  FROM DEPT
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4                  FROM EMP
  5                  WHERE COMM IS NOT NULL);

DNAME                                                                                               
--------------                                                                                      
SALES                                                                                               

SQL> SELECT LOC
  2  FROM DEPT
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4                  FROM EMP
  5                  WHERE COMM IS NOT NULL) AND DEPTNO=40;

no rows selected

SQL> SELECT LOC
  2  FROM DEPT
  3  WHERE DEPTNO=40 AND DEPTNO IN(
  4                      SELECT DEPTNO
  5                      FROM EMP
  6                      WHERE COMM IS NOT NULL);

no rows selected

SQL> SPOOL OFF
