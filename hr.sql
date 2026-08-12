SELECT * FROM EMPLOYEES e ;

-- EMPLOYEES 에서first_name, last_name, job_id 컬럼만 조회
SELECT e.FIRST_NAME, e.last_name, e.job_id FROM EMPLOYEES e ;

-- EMPLOYEES에서 연봉이 12000 이상 되는 직원들의 LAST_NAME, SALARY 조회
SELECT e.last_name,e.SALARY FROM EMPLOYEES e WHERE e.SALARY >12000 ;
-- 사원번호가 176인 직원의 LAST_NAME, DEPARTMENT_ID 조회
SELECT e.LAST_NAME ,e.DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE e.EMPLOYEE_ID 
-- 연봉이 5000 에서 12000 범위 이외인 사람들의 LAST_NAME, SALARY 조회
SELECT
	e.LAST_NAME ,
	e.SALARY 
FROM
	EMPLOYEES e;
WHERE
 e.salary < 5000 OR e.salary <12000;

-- 20번 or 50번 부서에서 근무하는 모든 사원들의
-- LAST_NAME, DEPART~~NO 오름차순
SELECT
	e.LAST_NAME ,
	e.DEPARTMENT_ID
FROM
	EMPLOYEES e
WHERE
	e.DEPARTMENT_ID IN(20, 50)
ORDER BY
	e.LAST_NAME ,
	e.DEPARTMENT_ID ;
-- 커미션이 0보다 큰 사원들의 LAST_NAME,SALARY,COMMISION_PCT 조회
-- 단, SALARY 내림차순, COMMISION_PCT 내림차순
SELECT
	e.LAST_NAME ,
	e.SALARY ,
	e.COMMISSION_PCT 
FROM
	EMPLOYEES e
WHERE
	e.COMMISSION_PCT > 0
	AND e.LAST_NAME ,
ORDER by	
	e.SALARY DESC,
	e.COMMISSION_PCT DESC;

-- SALARY 가 2500 OR 3500 OR 7000 이 아니며 JOB_ID 가
-- SA_REP OR ST_CLERK 인 직원 조회 
SELECT
	*
FROM
	EMPLOYEES e
WHERE
	e.SALARY NOT IN(2500, 3500, 7000)
	AND e.JOB_ID IN('SA_REP', 'ST_CLERK');

-- 2015년도에 고용된 직원 조회 후 입사일(HIRE_DATE) 기준으로 오름차순 정렬
SELECT
	*
FROM
	EMPLOYEES e
WHERE
	e.HIRE_DATE >= '2015-01-01'
	AND e.HIRE_DATE <= '2015-12-31'
ORDER BY
	e.HIRE_DATE ;


-- 20번 or 50번 부서에서 근무하는 모든 사원들의
-- LAST_NAME, DEPART~~NO 오름차순
-- 단, SALARY 가 5000 ~ 12000 이하인 
SELECT
	E.LAST_NAME ,
	E.DEPARTMENT_ID 
FROM
	EMPLOYEES e
WHERE
	E.DEPARTMENT_ID IN(20, 50)
AND E.SALARY BETWEEN 5000 AND 12000;
ORDER BY
	e.LAST_NAME ,
	E.DEPARTMENT_ID;
-- SALARY 가 5000 ~ 12000 범위가 아닌 직원들의
-- LAST_NAME, SALARY 조회
SELECT
	E.LAST_NAME ,
	E.SALARY 
FROM
	EMPLOYEES e
WHERE
	E.DEPARTMENT_ID IN(20, 50)
AND E.SALARY NOT BETWEEN 5000 AND 12000;
ORDER BY
	e.LAST_NAME ,
	E.SALARY ;

-- 2015년도에 고용된 직원 조회
SELECT
	*
FROM
	EMPLOYEES e
WHERE
	e.HIRE_DATE BETWEEN '2015-01-01' AND '2015-12-31'
ORDER BY
	e.HIRE_DATE ;

-- last_name 에 u 가 포함된 사원들의 first_name, last_name, employee_id 조회
SELECT
	e.FIRST_NAME ,
	e.LAST_NAME ,
	e.EMPLOYEE_ID
FROM
	EMPLOYEES e
WHERE
	e.LAST_NAME LIKE '%u%';

-- last_name 의 네번째 글자가 a 인 사원들의 employee_id,first_name,last_name 조회
SELECT
	e.FIRST_NAME ,
	e.LAST_NAME ,
	e.EMPLOYEE_ID
FROM
	EMPLOYEES e
WHERE
	e.LAST_NAME LIKE '___a%';

-- last_name 에 a 혹은 e 글자가 있는 사원들의 employee_id,first_name,last_name 조회
SELECT
	e.FIRST_NAME ,
	e.LAST_NAME ,
	e.EMPLOYEE_ID
FROM
	EMPLOYEES e
WHERE
	e.LAST_NAME LIKE '%a%'
	OR e.LAST_NAME LIKE '%e%';

-- manager_id 가 없는 직원들의 last_name, job_id 조회
SELECT e.LAST_NAME ,e.JOB_ID 
FROM EMPLOYEES e 
WHERE e.MANAGER_ID IS NULL;
-- ST_CLERK 인 직업 id 를 가진 사원이 없은 부서 id 조회(단, 부서번호가 NULL 인 경우 제외)
SELECT
	e.LAST_NAME ,E.JOB_ID 
FROM
	EMPLOYEES e
WHERE
	e.JOB_ID NOT IN ('ST_CLERK')
	AND e.DEPARTMENT_ID  IS NOT NULL; 

-- COMMISSION_PCT 가 NULL 이 아닌 사원들 중에서 COMMISSION = SALARY * COMMISSION_PCT를 구한 후
-- EMPLOYEE_ID,FIRST_NAME,JOB_ID 조회
SELECT
	e.DEPARTMENT_ID, e.FIRST_NAME, e.JOB_ID,  
	 e.SALARY * e.COMMISSION_PCT AS COMMISSION
FROM
	EMPLOYEES e
WHERE
	e.COMMISSION_PCT IS NOT NULL;
	

-- 문자열 함수
-- frist_name 이 Curtis인 사람의 first_name,last_name,email,phone_number,job_id 조회
-- 단, job_id 의 결과는 소문자로 출력
SELECT E.FIRST_NAME ,E.LAST_NAME,E.EMAIL, E.PHONE_NUMBER, lower(E.JOB_ID) 
FROM EMPLOYEES e 
WHERE E.FIRST_NAME = 'Curtis';


-- 부서번호가 60,70,80,90인 사원들의 employee_id, first_name, hire_date, job_id 조회
-- 단, job_id 가 IT_PROG 인 사원의 경우 '프로그래머' 로 변경후 출력
SELECT
	e.EMPLOYEE_ID ,
	e.FIRST_NAME ,
	e.HIRE_DATE ,
	REPLACE(e.JOB_ID , 'IT_PROG', '프로그래머')
FROM 
 	EMPLOYEES e
WHERE
e.DEPARTMENT_ID IN (60, 70, 80, 90);
--JOB_ID 가 AD_PRES, PU_CLERK 인 사원들의 EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_ID
-- JOB_ID 를 조회, 단, 사원명은 FIRST_NAME,LAST_NAME 을 연결하여 출력(사이에 공백 하나 포함)

SELECT 
	e.EMPLOYEE_ID ,
	e.FIRST_NAME || ' ' || E.LAST_NAME,
	e.DEPARTMENT_ID,
	E.JOB_ID 
FROM 
 	EMPLOYEES e
WHERE
	e.JOB_ID  IN ('AD_PRES','PU_CLERK')

-- 입사 10주년이 되는 날짜 출력
-- 사원번호, 이름(f,l),입사일
SELECT
	e.FIRST_NAME ,
	e.LAST_NAME ,
	e.EMPLOYEE_ID ,
	add_months(e.HIRE_DATE , 120)
FROM
	EMPLOYEES e;













