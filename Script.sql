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


-- 다중행 함수
-- sum(), avg(), count(), max(), min()

-- 추가 수당 총계
SELECT sum(e.COMM ) FROM emp e;

-- 급여 총계
SELECT sum(e.sal), sum(DISTINCT e.sal), sum(ALL e.sal) FROM emp e;

-- 개수
SELECT
	count(e.COMM),
	count(*),
	count(e.sal),
	count(DISTINCT e.sal),
	count(ALL e.sal)
FROM
	emp e;

-- 최대값, 최소값
SELECT max(e.sal), min(e.sal) FROM emp e;

-- 10 번 부서의 최고급여, 최저급여 조회
SELECT
	max(e.sal),
	min(e.sal)
FROM
	emp e
WHERE e.DEPTNO = 10;

SELECT
	max(e.hiredate),
	min(e.HIREDATE )
FROM
	emp e;

-- 평균
SELECT
	avg(e.sal),
	avg(DISTINCT e.sal),
	avg(ALL e.sal)
FROM
	emp e;

--SQL Error [937] [42000]: ORA-00937: 단일 그룹의 그룹 함수가 아닙니다
--SELECT e.empno, sum(e.comm) FROM emp e;

-- 결과값을 원하는 열로 묶어 출력 : group by

-- 부서별 급여 평균 구하기
SELECT e.DEPTNO , avg(e.sal) FROM emp e GROUP BY e.DEPTNO ;

-- 부서별,직책별 급여 평균 구하기
SELECT
	e.DEPTNO ,
	e.job,
	avg(e.sal)
FROM
	emp e
GROUP BY
	e.DEPTNO,
	e.JOB 
ORDER BY 
	e.DEPTNO ,
	e.JOB ;

-- group by ~~ having
-- where 절에 그룹함수 사용 불가
-- having : 만든 그룹을 조견별로 출력할 때 사용
-- where 절과 having 이 존재 시 where 가 먼저 실행 


--SQL Error [934] [42000]: ORA-00934: 그룹 함수는 허가되지 않습니다
SELECT
	e.DEPTNO ,
	e.job,
	avg(e.sal)
FROM
	emp e
WHERE avg(e.sal) > 200
GROUP BY
	e.DEPTNO,
	e.JOB 

-- 부서별,직책별 급여 평균 구하기(단, 급여가 2000 이상인 평균그룹만 출력)

SELECT
	e.DEPTNO ,
	e.job,
	avg(e.sal)
FROM
	emp e
GROUP BY
	e.DEPTNO,
	e.JOB 
HAVING avg(e.sal) >= 2000
ORDER BY e.DEPTNO ,e.JOB ;


-- 급여가 3000 이하인 직원들의 부서별,직책별 급여 평균 구하기(단, 급여가 2000 이상인 평균그룹만 출력)
SELECT
	e.DEPTNO ,
	e.job,
	avg(e.sal)
FROM
	emp e
WHERE e.sal <= 3000
GROUP BY
	e.DEPTNO,
	e.JOB 
HAVING avg(e.sal) >= 2000
ORDER BY e.DEPTNO ,e.JOB ;

-- 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수 출력
-- Manager 3
SELECT
	e.job,
	count(*)
FROM
	EMP e
GROUP BY
	e.job
HAVING
	count(e.job)>= 3;
	-- 사원들의 입사연도를 기준으로 부서별로 몇명이 입사했는지 출력
-- 입사연도 to_char()
-- 1981 10 1 
SELECT
	TO_CHAR(e.HIREDATE , 'YYYY'),e.DEPTNO ,count(*)
FROM
	emp e
GROUP BY
	TO_CHAR(e.HIREDATE , 'YYYY'),
	e.DEPTNO; 	
	
-- 데이터베이스 설계	
-- 데이터를 효율적으로 저장하고 관리하기 위해 테이블릐 구조를 미리 정하는 것	
	
-- 조인 : 여러 테이블을 하나의 테이블처럼 사용
-- 1) 내부조인(INNER JOIN)	
-- 2) 외부조인(OUTER JOIN)	
--	- LEFT OUTER JOIN 
--	- RIGHT OUTER JOIN 	
--	- FULL OUTER JOIN 	

-- 48 행
SELECT *
FROM
	EMP e , DEPT d
WHERE e.DEPTNO = d.DEPTNO 
ORDER BY e.EMPNO; 

--(INNER) JOIN ~ ON : 내부조인
-- 두 개의 테이블에서 일치하는 정보(등가조인)를 기준으로 가져오기
SELECT
	E.EMPNO ,E.ENAME ,E.DEPTNO ,D.DNAME ,D.LOC 
FROM
	EMP e
JOIN DEPT d
ON
	e.DEPTNO = d.DEPTNO
ORDER BY
	e.EMPNO; 

-- 비등가 조인
-- EMP + SALGRADE 
-- SAL 800 => 700 ~ 1200 => GRADE 추출

SELECT *
FROM
	EMP e , SALGRADE s 
WHERE e.SAL BETWEEN S.LOSAL AND S.HISAL  
ORDER BY e.EMPNO; 



SELECT E.EMPNO ,E.ENAME ,E.SAL ,S.GRADE 
FROM
	EMP e JOIN SALGRADE s 
ON  e.SAL BETWEEN S.LOSAL AND S.HISAL  
ORDER BY e.EMPNO; 

-- SELF JOIN
-- 자체 조인 


SELECT E.EMPNO ,E.ENAME ,E.MGR ,E2.ENAME 
FROM
	EMP e , EMP E2
WHERE  E.MGR = E2.EMPNO  
ORDER BY e.EMPNO;

-- 열의 정의가 애매합니다
SELECT
	E.EMPNO ,
	E.ENAME ,
	e,MGR ,
	E2.ENAME
FROM
	EMP e 
JOIN	EMP E2
ON
	E.MGR = E2.EMPNO
ORDER BY
	e.EMPNO;


-- 외부조인 : 일치하지 않는 정보 가져오기(단, 왼족테이블 기준? 오른쪽 테이블 기준)
-- LEFT OUTER JOIN (왼쪽외부조인)
SELECT E.EMPNO ,E.ENAME ,E.MGR ,E2.ENAME 
FROM
	EMP e , EMP E2
WHERE  E.MGR = E2.EMPNO(+)  
ORDER BY e.EMPNO;



-- RIGHT OUTER JOIN(오른쪽 외부 조인)
SELECT E.EMPNO ,E.ENAME ,E.MGR ,E2.ENAME 
FROM
	EMP e , EMP E2
WHERE  E.MGR(+) = E2.EMPNO  
ORDER BY e.EMPNO;

-- LEFT (OUTER) JOIN / RIGHT(OUTER) JOIN


SELECT
	E.EMPNO ,
	E.ENAME ,
	E.MGR ,
	E2.ENAME
FROM
	EMP e
LEFT OUTER JOIN EMP E2
ON
	E.MGR = E2.EMPNO
ORDER BY
	e.EMPNO;




SELECT
	E.EMPNO ,
	E.ENAME ,
	E.MGR ,
	E2.ENAME
FROM
	EMP e
RIGHT JOIN EMP E2
ON
	E.MGR = E2.EMPNO
ORDER BY
	e.EMPNO;



SELECT
	E.EMPNO ,
	E.ENAME ,
	E.MGR ,
	E2.ENAME
FROM
	EMP e
FULL JOIN EMP E2
ON
	E.MGR = E2.EMPNO
ORDER BY
	e.EMPNO;

-- 사원,부서 정보 출력(단, 급여가 2000초과인 사원만)
SELECT
	E.EMPNO ,E.ENAME ,E.DEPTNO ,D.DNAME ,D.LOC 
FROM
	EMP e
JOIN DEPT d
ON
	e.DEPTNO = d.DEPTNO
WHERE E.SAL > 2000
ORDER BY
	e.EMPNO; 


-- 서브쿼리
-- where 절에 사용하는 서브쿼리
-- from 절 : 인라인 뷰
-- select 절 : 스칼라 서브쿼리

--SELECT *
--FROM EMP e 
--WHERE e.EMPNO =(SELECT e.EMPNO FROM emp e)

-- 왼쪽 메인쿼리 오른쪽 (서브쿼리)

-- 단일행 서브 쿼리
-- =,>=,<,<=,<>,^=,!=

-- jones 의 급여보다 높은 급여를 받는 사원 조회
SELECT * FROM EMP e WHERE e.sal > (SELECT e2.sal FROM emp e2 WHERE e2.ENAME ='JONES');


-- WARD 의 입사일보다 빨리 입사한 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.HIREDATE  < (
	SELECT
		e2.HIREDATE 
	FROM
		emp e2
	WHERE
		e2.ENAME = 'WARD');

-- 20번 부서에 속한 사원 중 전체 사원의 평균급여보다 높은 급여를 받는 사원 조회
-- 부서정보(부서명,위치) 조회
SELECT
	E.EMPNO ,E.ENAME ,E.JOB ,E.SAL ,D.DNAME ,D.LOC 
FROM
	EMP e
JOIN DEPT d ON
	E.DEPTNO = D.DEPTNO
WHERE
	e.DEPTNO = 20
	AND E.SAL > (
	SELECT
		AVG(E2.SAL)
	FROM
		emp e2);


--QL Error [1427] [21000]: ORA-01427: 단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
SELECT * FROM EMP e WHERE e.sal > (SELECT e2.sal FROM emp e2 WHERE e2.JOB ='MANAGER');

-- 다중행 서브쿼리 
-- in, any(some), all, exists
SELECT * FROM EMP e WHERE e.sal in (SELECT max(e2.sal) FROM emp e2 GROUP BY e2.DEPTNO );


-- any(some) : 메인쿼리릐 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 true 반환
-- = any == in
SELECT * FROM EMP e WHERE e.sal = some (SELECT max(e2.sal) FROM emp e2 GROUP BY e2.DEPTNO );



-- < any == max()
SELECT
	*
FROM
	EMP e
WHERE
	e.sal < ANY (
	SELECT
		e2.sal
	FROM
		emp e2
	WHERE
		e2.DEPTNO = 30 )
ORDER BY
	e.sal,
	e.EMPNO;





SELECT
	*
FROM
	EMP e
WHERE
	e.sal <  (
	SELECT
		max(e2.sal)
	FROM
		emp e2
	WHERE
		e2.DEPTNO = 30 )
ORDER BY
	e.sal,
	e.EMPNO;

-- all : 서브쿼리의 모든 결과가 조건식에 맞아 떨어져야만 메인 쿼리의 조건식이 true 가 됨
SELECT
	*
FROM
	EMP e
WHERE
	e.sal < All (
	SELECT
		e2.sal
	FROM
		emp e2
	WHERE
		e2.DEPTNO = 30 )
ORDER BY
	e.sal,
	e.EMPNO;


-- exist : 서브쿼리에 결과값이 하나 이상 있으면 조건식이 모두 true, 없으면 false
SELECT
	*
FROM
	EMP e
WHERE
	exists (
	SELECT
		d.DNAME 
	FROM
		dept d 
	WHERE
		d.DEPTNO = 70 );


-- 전체 사원 중 ALLEN 과 같은 직책인 사원들의 사원정보,부서정보 조회(사번,이름,직무,부서명 출력)
SELECT
	E.ENAME ,E.EMPNO ,E.JOB ,D.DNAME 
FROM
	EMP E
JOIN DEPT d ON
	E.DEPTNO = D.DEPTNO
WHERE
	E.JOB = (
	SELECT E2.JOB
	FROM
		EMP E2
	WHERE
		E2.ENAME = 'ALLEN');





-- 10번 부서에 근무하는 사원 중 30번 부서에 없는 직책을 가진 사원의 사번,이름,직무,부서명,부서위치 조회
SELECT
	E.ENAME ,E.EMPNO ,E.JOB ,D.DNAME 
FROM
	EMP E
JOIN DEPT d ON
	E.DEPTNO = D.DEPTNO
WHERE
	E.DEPTNO = 10 AND E.JOB  NOT IN (
	SELECT E2.JOB
	FROM
		EMP E2
	WHERE
		E2.DEPTNO  = 30);

-- 비교할 열이 여러 개인 다중열 서브쿼리
SELECT
	*
FROM
	EMP e
WHERE
	(E.DEPTNO ,
	E.SAL) IN (
	SELECT
		E2.DEPTNO,
		MAX(E2.SAL)
	FROM
		EMP E2
	GROUP BY
		E2.DEPTNO );

-- FROM 절에 사용하는 서브쿼리(인라인뷰)

SELECT E10.*,D.*
FROM (SELECT * FROM EMP e WHERE E.DEPTNO = 10) E10,(SELECT * FROM DEPT D)D
WHERE E10.DEPTNO  = D.DEPTNO ;

-- SELECT 절 서브쿼리(스칼라 서브쿼리)
SELECT
	E.EMPNO ,
	E.ENAME ,
	E.SAL ,
	(
	SELECT
		S.GRADE
	FROM
		SALGRADE s
	WHERE
		E.SAL BETWEEN S.LOSAL AND S.HISAL) AS SALGRADE,
 	(SELECT D.DNAME FROM DEPT d WHERE E.DEPTNO =D.DEPTNO) AS DNAME
FROM
	EMP E;

-- 데이터 조작어(DML) : 추가,수정,삭제
-- 1) 추가 : insert
--INSERT INTO 테이블명(컬럼명,...) 
--VALUES (값1,값2,...)



-- 연습용 테이블 생성
-- dept 테이블 복제
CREATE TABLE dept_tmp AS SELECT * FROM dept;

-- emp 테이블 구조만 복제 
CREATE TABLE emp_tmp AS SELECT * FROM emp WHERE 1<>1;

SELECT * FROM DEPT_TMP dt ;
SELECT * FROM EMP_TMP et  ;

-- dept_tmp 테이블에 50번부서 추가
INSERT INTO DEPT_TMP(deptno,dname,loc)
VALUES(50,'DATABASE','SEOUL');

-- 컬럼명을 생략하는 경우는 컬럼수에 맞춰서 값이 들어오는 경우
INSERT INTO DEPT_TMP
VALUES(60,'NETWORK','BUSAN');

-- NULL 삽입이 가능한 컬럼의 값은 NULL 명시 
INSERT INTO DEPT_TMP(DEPTNO,DNAME,LOC)
VALUES(70,'WEB',NULL);

-- NULL 암시적 처리 
INSERT INTO DEPT_TMP(DEPTNO,DNAME)
VALUES(80,'0S');

-- 날짜 데이터 삽입
-- -, / 

INSERT INTO EMP_TMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
VALUES(1111,'성춘향','MANAGER',9999,'2010/10/25',4000,NULL,20);
SELECT * FROM EMP_TMP;


INSERT INTO EMP_TMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
VALUES(2222,'홍길동','MANAGER',9999,'2010-10-25',4000,NULL,20);

INSERT INTO EMP_TMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
VALUES(3333,'김수호','MANAGER',1111,SYSDATE,4000,NULL,20);

-- 서브쿼리를 이용한 INSERT 
-- EMP 테이블 데이터 => EMP_TMP

INSERT
	INTO
	EMP_TMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT
	EMPNO,
	ENAME,
	JOB,
	MGR,
	HIREDATE,
	SAL,
	COMM,
	DEPTNO
FROM
	EMP e; 


INSERT
	INTO
	EMP_TMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT
	EMPNO,
	ENAME,
	JOB,
	MGR,
	HIREDATE,
	SAL,
	COMM,
	DEPTNO
FROM
	EMP e
JOIN SALGRADE s ON
	E.SAL BETWEEN S.LOSAL AND S.HISAL
	AND S.GRADE = 1; 

SELECT * FROM EMP_TMP ET;

-- 수정 : UPDATE
--UPDATE 테이블명
--SET 컬럼명 = 값, 컬럼명=값
--WHERE 조건

--DEPT_TMP 10 부서번호의 부서명 변경(TOKYO)
SELECT * FROM DEPT_TMP dt ;
UPDATE DEPT_TMP DT
SET DT.LOC = 'TOKYO'
WHERE DT.DEPTNO = 10;

--EMP_TEMP 테이블의 사원 중에서 SAL 이 2500 이하인 사원만 추가수당을 50으로 수정
SELECT * FROM EMP_TMP et; 

UPDATE EMP_TMP et 
SET ET.COMM =50 
WHERE ET.SAL <=2500;

-- DEPT 테이블의 40번 부서의 DNAME,LOC 를 가져와서 DEPT_TEMP 50번 부서의 내용으로 변경
UPDATE DEPT_TMP dt 
SET(DT.DNAME,DT.LOC)=(SELECT D.DNAME ,D.LOC FROM DEPT D WHERE D.DEPTNO =40)
WHERE DT.DEPTNO  = 50;

-- 삭제 : delete
--DELETE FROM 테이블명 WHERE 삭제할 조건 

SELECT * FROM EMP_TMP et; 

-- empno = 1111 사원 삭제
DELETE FROM EMP_TMP WHERE empno =1111;

-- 데이터 전체 삭제 
DELETE FROM emp_tmp;


-- emp,dept,salgrade 테이블을 복사 
-- exam_emp, exam_dept, exam_salgrade
CREATE TABLE exam_emp AS SELECT * FROM emp ;
CREATE TABLE exam_dept AS SELECT * FROM dept; 
CREATE TABLE exam_salgrade AS SELECT * FROM salgrade; 

SELECT * FROM exam_emp;

-- 새로 생성된 테이블에 데이터 삽입
-- exam_dept
-- 50, ORACLE, BUSAN
-- 60, SQL, ILSAN
-- 70, SELECT, INCHEON
-- 80, DML, BUNDANG
INSERT INTO exam_dept 
VALUES (50,'ORACLE','BUSAN');
INSERT INTO exam_dept 
VALUES (60,'SQL','ILSAN');  
INSERT INTO exam_dept 
VALUES (70,'SELECT','INCHEON'); 
INSERT INTO exam_dept 
VALUES (80,'DML','BUNDANG');

SELECT * FROM exam_DEPT;
-- exam_emp 테이블에 임의의 사원 정보 삽입
-- 5명 삽입 
INSERT INTO EXAM_EMP
VALUES(1111,'성춘향','MANAGER',9999,'2010/10/25',4000,NULL,20);
INSERT INTO EXAM_EMP
VALUES(2222,'성춘향','MANAGER',9999,'2010/10/25',4000,NULL,20);
INSERT INTO EXAM_EMP
VALUES(3333,'성춘향','MANAGER',9999,'2010/10/25',4000,NULL,20);
INSERT INTO EXAM_EMP
VALUES(4444,'성춘향','MANAGER',9999,'2010/10/25',4000,NULL,20);
INSERT INTO EXAM_EMP
VALUES(5555,'성춘향','MANAGER',9999,'2010/10/25',4000,NULL,20);
SELECT * FROM EXAM_EMP;
-- exam_emp 에 속한 사원 중 50번 부서에서 근무하는 사원의 평균 급여보다 많이 받는 사원을
-- 70번 부서로 옮기는 sql 구문 작성
UPDATE
	EXAM_EMP EE
SET
	EE.DEPT_NO = 70
WHERE
	EE.SAL >(
	SELECT
		AVG(E.SAL)
	FROM
		EXAM_EMP
	WHERE
		DEPT_NO = 50);



-- exam_emp 에 속한 사원 중 입사일이 가장 빠른 60번 부서 사원보다 늦게 입사한 사원의 급여를
-- 10% 인상하고 80번 부서로 옮기는 sql 구문 작성
UPDATE
	EXAM_EMP EE
SET
	EE.SAL = EE.SAL * 1.1,
	EE.DEPTNO = 80
WHERE
	EE.HIREDATE >(
	SELECT
		MIN(E.HIREDATE)
	FROM
		EXAM_EMP
	WHERE
		DEPTNO = 60);




-- exam_emp 에 속한 사원 중 급여 등급이 5인 사원을 삭제하는 sql 구문 작성
DELETE
FROM
	EXAM_EMP
WHERE
	EMPNO IN
	(
	SELECT
		EE.EMPNO
	FROM
		EXAM_EMP EE
	JOIN EXAM_SALGRADE ES ON
		EE.SAL BETWEEN ES.LOSAL AND ES.HISAL
		AND ES.GRADE = 5);
SELECT * FROM EXAM_EMP;


-- 트랜잭션 : 더 이상 분할할 수 없는 최소 수행 단위
-- C,U,D : INSERT,UPDATE,DELETE 

-- ROLLBACK : 트랜잭션 취소
-- COMMINT : 트랜잭션 반영

CREATE TABLE DEPT_TCL AS SELECT * FROM DEPT;
SELECT * FROM DEPT_TCL;

-- 트랜잭션 시작
INSERT INTO DEPT_TCL VALUES(50,'DATABASE','SEOUL');
UPDATE DEPT_TCL DT SET LOC='BUSAN' WHERE DT.DEPTNO=40;
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';
-- 트랜잭션 종료


COMMIT;
ROLLBACK;

SELECT * FROM DEPT_TCL; 

-- 세션 : 데이터베이스 접속을 시작으로 해서 관련작업을 수행한 후 접속을 종료하기까지의 전체 기간      
				
DELETE FROM DEPT_TCL 
WHERE DEPTNO =50;

COMMIT;

UPDATE DEPT_TCL dt 
SET DT.LOC = 'SEOUL'
WHERE DT.DEPTNO =30;
COMMIT;

-- DDL(데이터 정의어) - 즉시 반영
-- 테이블 정의
-- CREATE, ALTER, DROP 


--CREATE TABLE 테이블명(
--	컬럼명1 타입,
--	컬럼명2 타입,
--)
-- 테이블명은 문자로 시작(숫자, 특수문자_,$,#,한글)
-- SCOTT 안에서 동일한 테이블명은 존재 불가 
-- 예약어는 테이블 이름으로 사용 불가(ex order)
-- 컬럼명은 문자로 시작 
-- 하나의 테이블 안에서 컬럼명 중복 불가
-- 자료형 
-- 1) 숫자 number(전체자릿수,소수점이하자릿수) ex)number(7,2), number(8)
-- 2) 문자
-- varchar2(n바이트) : 가변길이 문자열 ex) varchar2(20) : 영어 20문자, 한글 6문자
-- char(n바이트) : 고정길이 문자열 ex) char(20)
-- nchar(n 개) : 고정길이 유니코드 문자열 ex) nchar(20) : 한글,영어 모두 20문자
-- nvarchar2(n 개) : 가변길이 유니코드 문자열
-- 3) 날짜 : date, timestamp 
-- 4) 대용량 데이터 :
--     CLOB : 대용량 문자 데이터
--    NCLOB : 대용량 유니코드 문자 데이터
--    BLOB  : 대용량 바이너리 데이터

CREATE TABLE EMP_DDL(
	EMPNO NUMBER(4),
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2)
);

CREATE TABLE DEPT_DDL AS SELECT * FROM DEPT;

-- 변경
-- 컬럼 추가
-- ALTER TABLE 테이블명 ADD 추가할컬럼명 타입;
-- HP 컬럼 추가
ALTER TABLE EMP_DDL ADD HP VARCHAR2(20);
SELECT * FROM EMP_DDL ED;
-- 컬럼명 변경
-- ALTER TABLE 테이블명 RENAME COLUMN 기존컬럼명 TO 변경컬럼명;
ALTER TABLE EMP_DDL RENAME COLUMN HP TO TEL;


-- 자료형(자료타입의 길이) 변경
-- ALTER TABLE 테이블명 MODIFY 컬럼명 변경할타입;
-- 사원번호 => 5자 
ALTER TABLE EMP_DDL MODIFY EMPNO NUMBER(5);



-- 컬럼 제거 
-- ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
-- TEL 컬럼 제거
ALTER TABLE EMP_DDL DROP COLUMN TEL;

-- 테이블 이름 변경 
--RENAME 원본테이블명 TO 변경테이블명;
-- EMP_DDL => EMP_RENAME
RENAME EMP_DDL TO EMP_RENAME;

-- 테이블 삭제
-- DROP TABLE 삭제할테이블명;
DROP TABLE EMP_RENAME ;













