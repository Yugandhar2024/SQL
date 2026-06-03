SQL> SELECT MIN(sal)FROM empWHERE sal >(    SELECT MIN(sal)    FROM emp);
SELECT MIN(sal)FROM empWHERE sal >(    SELECT MIN(sal)    FROM emp)
                                 *
ERROR at line 1:
ORA-00933: SQL command not properly ended 


SQL> ED
Wrote file afiedt.buf

  1  SELECT MIN(sal) 
  2  FROM emp
  3   WHERE sal >(    
  4  SELECT MIN(sal)    
  5* FROM emp)
SQL> /

  MIN(SAL)                                                                                          
----------                                                                                          
       950                                                                                          

SQL> SELECT MAX(sal)FROM empWHERE sal <(    SELECT MAX(sal)    FROM emp    WHERE sal <    (        SELECT MAX(sal)        FROM emp        WHERE sal <        (            SELECT MAX(sal)            FROM emp            WHERE sal <            (                SELECT MAX(sal)                FROM emp            )        )    ));
SELECT MAX(sal)FROM empWHERE sal <(    SELECT MAX(sal)    FROM emp    WHERE sal <    (        SELECT MAX(sal)        FROM emp        WHERE sal <        (            SELECT MAX(sal)            FROM emp            WHERE sal <            (                SELECT MAX(sal)                FROM emp            )        )    ))
                                 *
ERROR at line 1:
ORA-00933: SQL command not properly ended 


SQL> ED
Wrote file afiedt.buf

  1  SELECT MAX(sal)
  2  FROM emp
  3  WHERE sal <(    SELECT MAX(sal)    
  4  FROM emp    
  5  WHERE sal < (       
  6   SELECT MAX(sal)        
  7  FROM emp        
  8  WHERE sal < (            
  9  SELECT MAX(sal)            
 10  FROM emp            
 11  WHERE sal < (                
 12  SELECT MAX(sal)               
 13* FROM emp ))))
SQL> /

  MAX(SAL)                                                                                          
----------                                                                                          
      2450                                                                                          

SQL> SELECT ename
  2  FROM emp
  3  WHERE sal =
  4  (
  5      SELECT MAX(sal)
  6      FROM emp
  7      WHERE sal <
  8      (
  9          SELECT MAX(sal)
 10          FROM emp
 11          WHERE sal <
 12          (
 13              SELECT MAX(sal)
 14              FROM emp
 15          )
 16      )
 17  );

ENAME                                                                                               
----------                                                                                          
JONES                                                                                               

SQL> 
SQL> 
SQL> 
SQL> SELECT empno
  2  FROM emp
  3  WHERE sal =
  4  (
  5      SELECT MAX(sal)
  6      FROM emp
  7      WHERE sal <
  8      (
  9          SELECT MAX(sal)
 10          FROM emp
 11      )
 12  );

     EMPNO                                                                                          
----------                                                                                          
      7788                                                                                          
      7902                                                                                          

SQL> 
SQL> 
SQL> SELECT dname
  2  FROM dept
  3  WHERE deptno =
  4  (
  5      SELECT deptno
  6      FROM emp
  7      WHERE sal =
  8      (
  9          SELECT MAX(sal)
 10          FROM emp
 11          WHERE sal <
 12          (
 13              SELECT MAX(sal)
 14              FROM emp
 15              WHERE sal <
 16              (
 17                  SELECT MAX(sal)
 18                  FROM emp
 19                  WHERE sal <
 20                  (
 21                      SELECT MAX(sal)
 22                      FROM emp
 23                  )
 24              )
 25          )
 26        )
 27     )
 28  ;

DNAME                                                                                               
--------------                                                                                      
SALES                                                                                               

SQL> SELECT *FROM empWHERE hiredate =(    SELECT MIN(hiredate)    FROM emp    WHERE hiredate >    (        SELECT MIN(hiredate)        FROM emp    ));
SELECT *FROM empWHERE hiredate =(    SELECT MIN(hiredate)    FROM emp    WHERE hiredate >    (        SELECT MIN(hiredate)        FROM emp    ))
                               *
ERROR at line 1:
ORA-00933: SQL command not properly ended 


SQL> SELECT *
  2  FROM emp
  3  WHERE hiredate =
  4  (
  5      SELECT MIN(hiredate)
  6      FROM emp
  7      WHERE hiredate >
  8      (
  9          SELECT MIN(hiredate)
 10          FROM emp
 11      )
 12  );

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               

SQL> 
SQL> 
SQL> 
SQL> 
SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE HIREDATE=
  4  (
  5    SELECT MAX(HIREDATE)
  6    FROM EMP
  7    WHERE HIREDATE<
  8  (
  9    SELECT MAX(HIREDATE)
 10    FROM EMP
 11  )
 12  );

ENAME                                                                                               
----------                                                                                          
SCOTT                                                                                               

SQL> SELECT LOC
  2  FROM DEPT
  3  WHERE DEPTNO=
  4  (
  5    SELECT DEPTNO
  6    FROM EMP
  7    WHERE HIREDATE=
  8  (
  9    SELECT MIN(HIREDATE)
 10    FROM EMP
 11  )
 12  );

LOC                                                                                                 
-------------                                                                                       
DALLAS                                                                                              

SQL> SELECT *
  2  FROM emp
  3  WHERE sal =
  4  (
  5      SELECT MIN(sal)
  6      FROM emp
  7      WHERE sal >
  8      (
  9          SELECT MIN(sal)
 10          FROM emp
 11          WHERE sal >
 12          (
 13              SELECT MIN(sal)
 14              FROM emp
 15              WHERE sal >
 16              (
 17                  SELECT MIN(sal)
 18                  FROM emp
 19                  WHERE sal >
 20                  (
 21                      SELECT MIN(sal)
 22                      FROM emp
 23                      WHERE sal >
 24                      (
 25                          SELECT MIN(sal)
 26                          FROM emp
 27                          WHERE sal >
 28                          (
 29                              SELECT MIN(sal)
 30                              FROM emp
 31                          )
 32                      )
 33                  )
 34              )
 35          )
 36      )
 37  );

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               

SQL> SELECT dnameFROM deptWHERE deptno =(    SELECT deptno    FROM emp    WHERE sal =    (        SELECT MAX(sal)        FROM emp        WHERE sal <        (            SELECT MAX(sal)            FROM;
SELECT dnameFROM deptWHERE deptno =(    SELECT deptno    FROM emp    WHERE sal =    (        SELECT MAX(sal)        FROM emp        WHERE sal <        (            SELECT MAX(sal)            FROM
                           *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected 


SQL> ED
Wrote file afiedt.buf

  1  SELECT dname
  2  FROM dept
  3  WHERE deptno =
  4  (
  5      SELECT deptno
  6      FROM emp
  7      WHERE sal =
  8      (
  9          SELECT MAX(sal)
 10          FROM emp
 11          WHERE sal <
 12          (
 13              SELECT MAX(sal)
 14              FROM emp
 15          )
 16      )
 17* )
SQL> /
    SELECT deptno
    *
ERROR at line 5:
ORA-01427: single-row subquery returns more than one row 


SQL> ED
Wrote file afiedt.buf

  1  SELECT dname
  2  FROM dept
  3  WHERE deptno =
  4  (
  5      SELECT deptno
  6      FROM emp
  7      WHERE sal =
  8      (
  9          SELECT MAX(sal)
 10          FROM emp
 11          WHERE sal <
 12          (
 13              SELECT MAX(sal)
 14              FROM emp
 15          )
 16      )
 17* )
SQL> /
    SELECT deptno
    *
ERROR at line 5:
ORA-01427: single-row subquery returns more than one row 


SQL> ED
Wrote file afiedt.buf

  1  SELECT dname
  2  FROM dept
  3  WHERE deptno =
  4  (
  5      SELECT deptno
  6      FROM emp
  7      WHERE sal =
  8      (
  9          SELECT MAX(sal)
 10          FROM emp
 11          WHERE sal <
 12          (
 13              SELECT MAX(sal)
 14              FROM emp
 15          )
 16      )
 17* )
SQL> ;
  1  SELECT dname
  2  FROM dept
  3  WHERE deptno =
  4  (
  5      SELECT deptno
  6      FROM emp
  7      WHERE sal =
  8      (
  9          SELECT MAX(sal)
 10          FROM emp
 11          WHERE sal <
 12          (
 13              SELECT MAX(sal)
 14              FROM emp
 15          )
 16      )
 17* )
SQL> SPOOL OFF
