--scott 데이터베이스에 접속

--select : read

--emp 테이블의 모든 내용 보기

SELECT * FROM EMP e ;

-- 조회할 때 특정 행 단위로 조회(selection)
-- 조회할 때 특정 열 단위로 조회(projection)

SELECT e.EMPNO , e.ENAME , e.MGR  
FROM EMP e;

-- 중복 데이터 제거
SELECT DISTINCT deptno FROM emp e;

-- job 중복 데이터 제거
SELECT DISTINCT e.JOB  FROM emp e;

-- as 별칭
-- "별칭" or 별칭 (단, 별칭에 공백이 있다면 반드시 "" 사용)
-- as 키워드 생략 가능
SELECT e.EMPNO  "사원 번호" ,e.SAL * 12 AS 연봉
FROM emp e;

-- 정렬 : order by
-- 오름차순(default) : asc / 내림차순 : desc
SELECT e.EMPNO ,e.ENAME 
FROM emp e
ORDER BY e.EMPNO DESC ; 

--e.EMPNO ,e.ENAME ,e.sal /sal 내림차순
SELECT e.empno,e.ENAME ,e.SAL 
FROM emp e
ORDER BY e.SAL DESC;

--e.EMPNO ,e.ENAME ,e.sal / deptno 오름차순, sal 내림차순
SELECT e.empno,e.ENAME ,e.SAL 
FROM emp e
ORDER BY e.DEPTNO ASC , e.SAL DESC;

-- emp 테이블의 별칭 deptno 내림, ename 오름
--empno(EMPLOYEE_NO), ename(EMPLOYEE_NAME), mgr(MANAGER)
-- sal(SALARY), comm(COMMISSION), DEPTNO(DEPARTMENT_NO)
SELECT
	EMPNO employee_no,
	ENAME employee_name,
	mgr manager,
	sal Asalary,
	comm commision,
	deptno department_no
FROM EMP E
ORDER BY
	e.deptno deSC ,
	e.ename aSC;

-- 조건
-- 부서번호가 30번인 직원 조회
-- = : 같다
SELECT *
FROM emp e
WHERE e.DEPTNO = 30; 

-- empno 가 7782인 직원 조회
SELECT *
FROM emp e
WHERE e.EMPNO = 7782;

-- 부서번호가 30번이고, 사원직책이 salesman 직원 조회
SELECT *
FROM emp e
WHERE e.DEPTNO = 30 AND e.JOB  = 'SALESMAN';

-- 사원번호가 7499 이고 부서번호가 30인 사원 조회
SELECT *
FROM emp e
WHERE e.EMPNO  = 7499 AND e.DEPTNO   = 30 ;

-- 부서번호가 30 이거나(or) 사원직책이 CLERK 사원 조회
SELECT *
FROM emp e
WHERE e.EMPNO  = 30 or e.job = 'CLERK' ;

--sql(월급)일때
--연봉이 36000 인 사원의 전체 정보 조회
SELECT * FROM emp e WHERE e.sal *12 = 36000;
--월급여가 3000 초과인 사원의 전체 정보 조회
SELECT * FROM emp e WHERE e.sal > 3000;
--월급여가 2500 이상이고 사원직책이 ANALYST 인 사원정보 조회
SELECT * FROM emp e WHERE e.sal >=2500 AND e.job='ANALYST';
--사원직책이 MANAGER, SALESMAN, CLERK 인 사원정보 조회
SELECT * FROM emp e WHERE E.JOB ='MANAGER' OR E.JOB = 'SALESMAN' OR E.JOB ='CLERK';

-- ename 의 시작이 f 이후의 문자로 시작하는 사원정보 조회
SELECT * FROM emp e WHERE e.ename >='F';

-- = (같다) != (같지 않다)
SELECT * FROM emp e WHERE e.sal != 3000;
SELECT * FROM emp e WHERE e.sal <> 3000;
SELECT * FROM emp e WHERE e.sal ^= 3000;

-- IN 
SELECT
	*
FROM
	emp e
WHERE
	E.JOB IN( 'MANAGER','SALESMAN','CLERK');
	
-- NOT IN 
SELECT
	*
FROM
	emp e
WHERE
	E.JOB NOT IN( 'MANAGER','SALESMAN','CLERK');

-- 부서번호가 10 이거나 20번인 사원 조회
SELECT *
FROM EMP e
WHERE e.DEPTNO in(10,20);

-- 특정 범위 있는 값 추출할 때 사용 : BETWEEN A AND B
-- 급여가 2000 이상 3000 이하인 사원정보 조회
SELECT *
FROM EMP e
--WHERE E.SAL >=2000 AND E.SAL <= 3000;
WHERE E.SAL BETWEEN 2000 AND 3000;



