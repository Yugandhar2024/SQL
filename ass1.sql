SQL> s//elecct deptno,count(*)
SP2-0734: unknown command beginning "selecct de..." - rest of line ignored.
SQL> select deptno,count(*)
  2  from emp
  3  where job!='president'
  4  groupby deptno;
groupby deptno
*
ERROR at line 4:
ORA-00933: SQL command not properly ended 


SQL> ed
Wrote file afiedt.buf

  1  select deptno,count(*)
  2  from emp
  3  where job!='president'
  4* group by deptno
SQL> /

    DEPTNO   COUNT(*)                                                                               
---------- ----------                                                                               
        30          6                                                                               
        20          5                                                                               
        10          3                                                                               

SQL> select count(*),sum(sal)
  2  from emp
  3  group by job;

  COUNT(*)   SUM(SAL)                                                                               
---------- ----------                                                                               
         4       4150                                                                               
         4       5600                                                                               
         1       5000                                                                               
         3       8275                                                                               
         2       6000                                                                               

SQL> select count(*)
  2  from emp
  3  ed
  4  ;

  COUNT(*)                                                                                          
----------                                                                                          
        14                                                                                          

SQL> ed
Wrote file afiedt.buf

  1  select count(*),deptno
  2  from emp
  3  where job='manager'
  4* group by deptno;
  5  /
group by deptno;
               *
ERROR at line 4:
ORA-00911: invalid character 


SQL> ed
Wrote file afiedt.buf

  1  select count(*),deptno
  2  from emp
  3  where job='manager'
  4* group by deptno
  5  /

no rows selected

SQL> select *
  2  from emp;

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

SQL> select deptno,count(*)
  2  from emp
  3  where job='manager'
  4  group by deptno;

no rows selected

SQL> ed
Wrote file afiedt.buf

  1  select deptno,count(*) as number_of_managers
  2  from emp
  3  where job='manager'
  4* group by deptno
SQL> /

no rows selected

SQL> select count(*),avg(sal)
  2  from emp
  3  where deptno!=20
  4  group by deptno;

  COUNT(*)   AVG(SAL)                                                                               
---------- ----------                                                                               
         6 1566.66667                                                                               
         3 2916.66667                                                                               

SQL> spool off
SQL> select count(*),job
  2  from emp
  3  where ename like ('%a%')
  4  group by job;

no rows selected

SQL> ed
Wrote file afiedt.buf

  1  select count(*),job
  2  from emp
  3  where ename like ('%a%')
  4* group by ename
SQL> /
select count(*),job
                *
ERROR at line 1:
ORA-00979: not a GROUP BY expression 


SQL> ed
Wrote file afiedt.buf

  1  select count(*),ename
  2  from emp
  3  where ename like ('%a%')
  4* group by job;
SQL> /
group by job;
            *
ERROR at line 4:
ORA-00911: invalid character 


SQL> ed
Wrote file afiedt.buf

  1  select count(*),job
  2  from emp
  3  where ename like ('%a%')
  4* group by job;
SQL> ed
Wrote file afiedt.buf

  1  select count(*),job
  2  from emp
  3  where ename like ('%a%')
  4* group by job;
SQL> /
group by job;
            *
ERROR at line 4:
ORA-00911: invalid character 


SQL> select *
  2  from emp;

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

SQL> ed
Wrote file afiedt.buf

  1  select *
  2* from emp
SQL> SELECT JOB,COUNT(*) AS EMPLOYEE_COUNT
  2  FROM EMP
  3  WHERE ENAME LIKE '%A%'
  4  GROUP BY JOB;

JOB       EMPLOYEE_COUNT                                                                            
--------- --------------                                                                            
SALESMAN               3                                                                            
CLERK                  2                                                                            
MANAGER                2                                                                            

SQL> SELECT COUNT(*),DEPTNO,AVG(SAL)
  2  FROM EMP
  3  WHERE SAL>2000
  4  GROUP BY DEPTNO;

  COUNT(*)     DEPTNO   AVG(SAL)                                                                    
---------- ---------- ----------                                                                    
         1         30       2850                                                                    
         3         20 2991.66667                                                                    
         2         10       3725                                                                    

SQL> SELECT DEPTNO,SUM(SAL)
  2  FROM EMP
  3  WHERE JOB='SALESMAN'
  4  GROUP BY DEPTNO;

    DEPTNO   SUM(SAL)                                                                               
---------- ----------                                                                               
        30       5600                                                                               

SQL> SELECT  COUNT(*),JOB,MAX(SAL)
  2  FROM EMP
  3  GROUP BY JOB;

  COUNT(*) JOB         MAX(SAL)                                                                     
---------- --------- ----------                                                                     
         4 CLERK           1300                                                                     
         4 SALESMAN        1600                                                                     
         1 PRESIDENT       5000                                                                     
         3 MANAGER         2975                                                                     
         2 ANALYST         3000                                                                     

SQL> SELECT DEPTNO,MAX(SAL)
  2  FROM EMP
  3  GROUP BY DEPTNO;

    DEPTNO   MAX(SAL)                                                                               
---------- ----------                                                                               
        30       2850                                                                               
        20       3000                                                                               
        10       5000                                                                               

SQL> SELECT COUNT(*),SAL
  2  FROM EMP
  3  GROUP BY SAL;

  COUNT(*)        SAL                                                                               
---------- ----------                                                                               
         1       2450                                                                               
         1       5000                                                                               
         1       1300                                                                               
         2       1250                                                                               
         1       2850                                                                               
         1       2975                                                                               
         1       1100                                                                               
         2       3000                                                                               
         1        800                                                                               
         1       1600                                                                               
         1       1500                                                                               
         1        950                                                                               

12 rows selected.

SQL> SPOOL OFF
