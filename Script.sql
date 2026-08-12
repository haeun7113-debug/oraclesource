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


-- 2000 이상 3000 이하가 아닌
SELECT *
FROM EMP e
WHERE E.SAL NOT BETWEEN 2000 AND 3000;

-- like : 특정 문자 또는 특정 문자열을 포함하는 데이터를 조회
-- _ : 한 개의 문자 데이터를 의미
-- % : 길이와 상관없이 모든 문자 데이터를 의미

-- 사원 이름이 S로 시작하는 사원 정보 조회
SELECT *
FROM EMP e 
WHERE e.ENAME LIKE 'S%';


-- 사원 이름의 두번째 글자가 L인 사원 정보 조회
SELECT *
FROM EMP e 
WHERE e.ENAME LIKE '_L%';

-- 사원 이름에 AM 이 포함되어 있는 사원만 조회
SELECT *
FROM EMP e 
WHERE e.ENAME LIKE '%AM%';

-- 사원 이름에 AM 이 포함되어 있지 않는 사원만 조회
SELECT *
FROM EMP e 
WHERE e.ENAME NOT LIKE '%AM%';

-- IS NULL
-- comm 이 NULL 인 직원 조회
SELECT * FROM emp e where e.comm IS NULL;

-- mgr 이 null 인 직원 조회
SELECT * FROM emp e where e.mgr IS NULL;

-- NULL 에 산술, 비교 연산시 결과값은 모두 NULL
SELECT E.SAL,E.COMM, E.SAL * E.COMM , E.SAL +E.COMM 
FROM EMP e 


-- 집합 연산자
-- UNION, UNION ALL(중복인 결과값도 출력), MINUS, INTERSECT

SELECT E.EMPNO ,E.ENAME ,E.SAL ,E.DEPTNO 
FROM EMP e WHERE E.DEPTNO =10
UNION ALL
SELECT E.EMPNO ,E.ENAME ,E.SAL, E.DEPTNO  
FROM EMP e WHERE E.DEPTNO =10;


SELECT E.EMPNO ,E.ENAME ,E.SAL ,E.DEPTNO 
FROM EMP e 
MINUS
SELECT E.EMPNO ,E.ENAME ,E.SAL, E.DEPTNO  
FROM EMP e WHERE E.DEPTNO =10;



SELECT E.EMPNO ,E.ENAME ,E.SAL ,E.DEPTNO 
FROM EMP e 
INTERSECT
SELECT E.EMPNO ,E.ENAME ,E.SAL, E.DEPTNO  
FROM EMP e WHERE E.DEPTNO =10;



------
-- 연습문제
-- 1. 사원명이 S로 끝나는 사원 데이터 조회
SELECT E.ENAME 
FROM EMP e 
WHERE E.ENAME LIKE '%S';
-- 2. 30번 부서에서 근무하고 있는 사원 중에서 JOB 이 SALESMAN 인 사원의 사원번호,이름,직책,부서번호 조회
SELECT
	E.SAL ,
	E.JOB ,
	E.EMPNO,
	E.DEPTNO
FROM
	EMP e
WHERE
	E.DEPTNO = 30
	AND E.JOB = 'SALESMAN' ;

-- 3. 20번,30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원을 두가지 방식의
-- SELECT 문을 사용하여 사원번호,이름,직책,급여,부서번호를 출력
-- 집합 연산자를 사용하지 않는 방식

SELECT
	E.SAL ,
	E.JOB  ,
	E.SAL,
	E.DEPTNO
FROM
	EMP e
WHERE
	E.DEPTNO IN(20,30)
	AND E.SAL > 2000 ;
-- 집합 연산자를 사용한 방식
SELECT
	E.SAL ,
	E.JOB  ,
	E.SAL,
	E.DEPTNO
FROM
	EMP e
WHERE E.SAL > 2000
MINUS 
SELECT
	E.SAL ,
	E.JOB  ,
	E.SAL,
	E.DEPTNO
FROM
	EMP e WHERE E.e.DEPTNO  = 10;


-- 4. NOT BETWEEN A AND B 연산자를 사용하지 않고 급여 열이 2000 이상 3000 이하 범위 이외의 값을
-- 가진 데이터만 출력
SELECT * FROM EMP e  WHERE E.SAL < 2000 OR E.SAL >3000;


-- 5. 사원 이름에 E 가 포함된 30번 부서의 사원 중 급여가 1000~2000 사이가 아닌 사원이름,사원번호,
-- 급여, 부서번호를 출력
SELECT
	E.EMPNO  ,
	E.ENAME   ,
	E.SAL,
	E.DEPTNO
FROM
	EMP e 
WHERE E.ENAME  LIKE '%E%' 
		AND E.DEPTNO  = 30 AND E.SAL NOT BETWEEN 1000 AND 2000;
-- 6. 추가수당이 존재하지 않고 상급자가 있으며, 직책이 MANAGER, CLERK 인 사원 중에서 사원 이름의
-- 두번째 글자가 L 이 아닌 사원의 정보 출력
SELECT
	*
FROM
	EMP e
WHERE
	E.COMM IS NULL
	AND E.MGR IS NOT NULL
	AND E.JOB IN('MANAGER', 'CLERK')
	AND E.ENAME NOT LIKE '_L%';

-- 오라클 함수
-- 1. 문자함수 
-- upper(), lower(), initcap()

SELECT e.ENAME , UPPER(e.ENAME) , lower(e.ENAME), INITCAP(e.ENAME)
FROM EMP e; 

-- job 이 salesman 인 직원 조회
SELECT *
FROM EMP e 
WHERE lower(e.job) = 'salesman';



-- length(), lengthb() : 바이트 수 반환

SELECT e.ENAME , length(e.ENAME) , lengthb(e.ENAME)
FROM EMP e; 

-- dual : 더미 테이블
-- 한글 한자당 3byte
SELECT LENGTH('한글'), LENGTHB('한글')
FROM dual;

-- 직책 이름이 6자리 이상인 사원 조회
SELECT *
FROM EMP e 
WHERE length(e.job) >=6 ;


-- substr(문자열데이터,시작위치,추출길이) : 부분 문자열 추출
SELECT e.JOB ,SUBSTR(e.job,1,2),SUBSTR(e.job,3,2),SUBSTR(e.job,5)
FROM EMP e ;


-- -는 오른쪽에서 -1 
SELECT
	e.JOB ,
	SUBSTR(e.job,-LENGTH(e.JOB)),
	SUBSTR(e.job, -LENGTH(e.JOB), 2),
	SUBSTR(e.job, -3)
FROM
	EMP e ;

-- instr(원본문자열,찾을문자,시작위치,찾으려는 문자가 몇번째인지) : 문자열 데이터 안에서 특정 문자 위치 찾기
-- index : 1부터 시작
SELECT
	instr('HELLO ORACLE!', 'L') AS INSTR_1, 
	instr('HELLO ORACLE!', 'L', 5)AS INSTR_2,
	instr('HELLO ORACLE!','L',2,2)AS INSTR_3 
FROM
	dual; 

-- instr() 이용해서 사원이름에 S가 있는 사원 조회
SELECT *
FROM EMP E
WHERE  INSTR(E.ENAME ,'S') > 0;

--replace(원본,찾는문자,대체문자)
-- 010-1234-5678 에서 - 를 찾아서 공백으로 변경
SELECT
	'010-1234-5678',
	REPLACE('010-1234-5678', '-', ' '),
	REPLACE('010-1234-5678', '-')
FROM
	dual;

-- concat(문자1,문자2) : 두 문자열 데이터 연결
-- 7369 : SMITH
SELECT
	e.EMPNO ,
	e.ENAME,
	CONCAT(e.EMPNO, e.ENAME) ,
	CONCAT(e.EMPNO, CONCAT(':', e.ENAME))
FROM
	EMP e 

-- ||
SELECT
	e.EMPNO ,
	e.ENAME,
	e.EMPNO || e.ENAME,e.empno || ' : ' || e.ENAME 	
FROM
	EMP e 

-- 데이터의 공간을 특정 문자로 채우는 LPAD, RPAD	
SELECT
	'Oracle',
	LPAD('Oracle', 10, '#'),
	RPAD('Oracle', 10, '*'),
	LPAD('Oracle',10),
	RPAD('Oracle',10)
FROM
	dual;
	
SELECT RPAD('971225-',14,'*')
FROM DUAL;
	

-- 특정 문자를 지우는 TRIM, LTRIM, RTRIM
-- 삭제할 문자 미지정 시 공백 제거
SELECT
	'[' || TRIM(' __Oracle__ ') || ']' AS trim,
	'[' || LTRIM(' __Oracle__ ') || ']' AS Ltrim,
	'[' || RTRIM(' __Oracle__ ') || ']' AS Rtrim
FROM
	DUAL;
	
	
SELECT
	'[' || TRIM('_' FROM'__Oracle__') || ']' AS trim,
	'[' || LTRIM('<_Oracle_>','_<') || ']' AS Ltrim,
	'[' || RTRIM('<_Oracle_>','>_') || ']' AS Rtrim
FROM
	DUAL;



-- 2. 숫자함수
-- round(), trunc(), ceil(), floor(), mod()
SELECT
	round(1234.5678) AS round,
	round(1234.5678, 0) AS round0,
	round(1234.5678, 1) AS round1,
	round(1234.5678, 2) AS round2,
	round(1234.5678,-1) AS round_minus1,
	round(1234.5678,-2) AS round_minus2
FROM
	dual;




-- trunc : 특정위치에서 버림

SELECT
	trunc(1234.5678) AS trunc,
	trunc(1234.5678, 0) AS trunc0,
	trunc(1234.5678, 1) AS trunc1,
	trunc(1234.5678, 2) AS trunc2,
	trunc(1234.5678,-1) AS trunc_minus1,
	trunc(1234.5678,-2) AS trunc_minus2
FROM
	dual;

-- ceil() : 지정한 숫자와 가까운 큰 정수 
--floor() : 지정한 숫자와 가까운 작은 정수

SELECT ceil(3.14), floor(3.14), ceil(-3.14), floor(-3.14)
FROM dual;

-- mod() == % 
SELECT mod(15,6), mod(10,2), mod(11,2)
FROM dual;

-- 3. 날짜함수
SELECT sysdate, sysdate -1, sysdate +1   
FROM dual;

-- 현재 날짜를 기준으로 3개월 이후 날짜 조회 : add_months()
SELECT sysdate, add_months(sysdate,3)
FROM dual;

-- 두 날짜간의 개월 수 차이 : months_between() 
SELECT
	e.EMPNO ,
	e.HIREDATE ,
	sysdate,
	months_between(e.HIREDATE , sysdate) AS month1,
	months_between(sysdate, e.HIREDATE ) AS month2,
	trunc(months_between(sysdate , e.hiredate)) AS month3
FROM
	EMP e; 

-- last_day(날짜) : 날짜가 속한 달의 마지막 날짜 출력
-- next_day(날짜, 요일) : 특정 날짜를 기준으로 돌아오는 요일의 날짜 출력

SELECT  sysdate, last_day(sysdate), next_day(sysdate,'금요일')
FROM dual;

-- 형변환 함수
-- 1) to_char() : 숫자,날짜 데이터 => 문자 데이터 변환
-- 2) to_number() : 문자 데이터 => 숫자 데이터 변환
-- 3) to_date() : 문자 데이터 => 날짜 데이터 변환

SELECT sysdate,to_char(sysdate,'YYYY/MM/DD')
FROM dual;

SELECT
	sysdate,
	to_char(sysdate, 'MM'),
	to_char(sysdate, 'MON'),
	to_char(sysdate, 'MONTH'),
	to_char(sysdate, 'DD'),
	to_char(sysdate, 'DY'),
	to_char(sysdate, 'DAY')
FROM
	dual;


SELECT
	sysdate,
	to_char(sysdate, 'HH24:MI:SS'),
	to_char(sysdate, 'HH12:MI:SS AM'),
	to_char(sysdate, 'HH:MI:SS P.M.')
FROM
	dual;

-- 문자숫자와 산술연산 시 자동으로 숫자데이터로 형변환 발생 
SELECT 1300 - '1500','1300'+1500
FROM DUAL;

--SELECT '1,300' - '1,500','1,300'+'1,500'
--FROM DUAL;


SELECT
	TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
FROM
	DUAL;

-- 널 처리함수
-- NVL(널값, 널일때 변경할 값), NVL2(널값, 널이 아닐때, 널일때 변경할 값)

-- NULL + 숫자 = NULL
SELECT E.EMPNO ,E.ENAME ,E.SAL ,E.COMM ,E.SAL + E.COMM 
FROM EMP e; 


SELECT E.EMPNO ,E.ENAME ,E.SAL ,NVL(E.COMM, 0) ,E.SAL + NVL(E.COMM,0) 
FROM EMP e; 


SELECT
	E.EMPNO ,
	E.ENAME ,
	E.SAL ,
	NVL2(E.COMM, 'O', 'X'),
	NVL2(E.COMM, E.SAL * 12 + E.COMM,E.SAL *12)
FROM
	EMP e; 

--SQL Error [1722] [42000]: ORA-01722: 수치가 부적합합니다
SELECT NVL(E.COMM,'N/A')
FROM EMP e ;

SELECT NVL(TO_CHAR(E.COMM),'N/A')
FROM EMP e ;



--DECODE(검사대상이 될 열
-- 		조건1, 조건1이 만족하면 반환할 결과,
-- 		조건2, 조건2이 만족하면 반환할 결과,
--		'위 조건과 일치하지 않는 경우'
-- )

-- 직책이 MANAGER 인 사원은 SAL * 10%, SALESMAN 5%, ANALYST 는 그대로, 나머지 3%
-- 사원번호,이름,직책,급여 출력
SELECT
	E.EMPNO,
	E.ENAME ,
	E.JOB ,
	E.SAL,
	DECODE(E.JOB,
	'MANAGER', E.SAL * 1.1,
	'SALESMAN', E.SAL * 1.05,
	'ANALYST', E.SAL,
	E.SAL * 1.03
	) AS 급여
FROM
	EMP E;

--CASE 검사대상이 될 열
-- 		WHEN 조건1 THEN 조건1이 만족하면 반환할 결과
-- 		WHEN 조건2 THEN 조건2이 만족하면 반환할 결과
--		ELSE 위 조건과 일치하지 않는 경우
-- END

SELECT
	E.EMPNO,
	E.ENAME ,
	E.JOB ,
	E.SAL,
	CASE E.JOB
	WHEN 'MANAGER' THEN E.SAL * 1.1
	WHEN 'SALESMAN' THEN E.SAL * 1.05
	WHEN 'ANALYST' THEN E.SAL
	ELSE E.SAL * 1.03
	END AS 급여
FROM
	EMP E;

-- COMM 널이면 '해당없음' / COMM = 0 '수당없음' / COMM > 0 '수당 : 800'
-- COMM_TEXT 컬럼명 사용
SELECT
	E.EMPNO,
	E.ENAME,
	E.JOB ,
	E.SAL,
	CASE
	WHEN E.COMM IS NULL THEN '해당없음'
	WHEN E.COMM = 0 THEN '수당없음'
	WHEN E.COMM > 0 THEN ' 수당 : ' || E.COMM 
	END AS COMM_TEXT
FROM
	EMP E;

-- 입사일을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다.
-- 사원이 정직원이 되는 날짜를 YYY-MM-DD 형식으로 출력(R_JOB)
-- 단, 추가수당이 없는 사원의 추가수당은 N/A 로 출력(COMM)
-- 사번,이름,고용일,
SELECT
	E.EMPNO,
	E.ENAME,
	E.HIREDATE,
	TO_CHAR(NEXT_DAY(ADD_MONTHS(E.HIREDATE,3), '월요일'),'YYYY-MM-DD') AS R_JOB,
	NVL(TO_CHAR(E.COMM),'N/A')
FROM 
	EMP E;
-- MGR 을 기준으로 CHG_MGR 컬럼에 출력
-- 직속상관 번호가 없는 경우 0000
-- 직속상관 앞 번호 2자리가 75 5555
-- 직속상관 앞 번호 2자리가 76 6666
-- 직속상관 앞 번호 2자리가 77 7777
-- 직속상관 앞 번호 2자리가 78 8888
-- 그외는 본래 직속상관의 사번 그대로 출력

SELECT
	E.EMPNO,
	E.ENAME,
	E.JOB ,
	E.MGR,
	CASE
		SUBSTR(TO_CHAR(NVL(E.MGR, 0)),1,2)
	WHEN '00' THEN '0000'
		WHEN '75' THEN '5555'
		WHEN '76' THEN '6666'
		WHEN '77' THEN '7777'
		WHEN '78' THEN '8888'
	  ELSE TO_CHAR(E.MGR)	
	END AS CHG_MGR
FROM
	EMP E;










