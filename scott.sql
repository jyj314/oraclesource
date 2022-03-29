-- dept 테이블 정보(부서정보-부서번호, 부서명, 위치)

DESC dept;

-- 사원정보(사원번호, 사원명, 직책, 직속상관의 사원번호, 입사일, 급여, 추가수당, 부서번호)
desc emp;

-- 급여구간(등굽, 최저급여, 최고급여
desc salgrade;


-- 조회(SELECT) : 실문에서 가장 많이 사용
-- SELECT 조회하고 싶은 열이름 나열
-- FROM 조회할 테이블명

SELECT
    deptno
FROM
    dept;

SELECT
    deptno,
    dname
FROM
    dept;

SELECT
    *
FROM
    dept;

SELECT
    *
FROM
    emp;

SELECT
    empno,
    ename,
    deptno
FROM
    emp;

-- 중복 데이터 제거 distinct
SELECT DISTINCT
    deptno
FROM
    emp;

SELECT DISTINCT
    job,
    deptno
FROM
    emp;
    
-- ALAIS(별칭)
-- as 별칭 : as 생략가능
SELECT
    ename           AS 사원명,
    sal             급여,
    comm            AS "추가 수당",
    sal * 12 + comm AS 연봉
FROM
    emp;
    
-- 원하는 순서로 출력 데이터를 정렬
-- order by 정렬할 열이름 [정렬옵션]

--emp 테이블에서 ename, sal 조회할 때 sal 내림차순 조회
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;
    
-- emp 테이블에서 ename, sal 조회할 때 sal 오름차순 조회
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal; -- 기분 정렬값이 오름차순 (ASC)
    
--EMP 테이블의 전체 열을 조회(부서번호는 오름차순이고, 급여의 내림차순)
SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;
    
-- 특정한 조건을 기준으로 데이터 조회
-- select ~ from ~ where 기준

SELECT
    *
FROM
    emp
WHERE
    deptno = 30;

-- 사원번호가 7782 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;
    
-- 부서번호가 30이고 사원직책이 SALESMAN 인 사원 조회
-- 문자열 표현 : 홑따옴표 ''
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';
    
-- 사원번호가 7499 이고 부서번호가 30인 사원 조회

SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;
    
-- 부서번호가 30 이거나, 사원직책이 CLERK 인 사원 조회

SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';

-- 연산자
-- 산술연산자
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;
    
-- 비교연산자(>,<,>=,<=)
SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;
    
-- 문자도 대소비교 연산자 사용가능    
-- ENAME 'F' 이상인 사원 조회(사원 이름의 첫문자가 F와같거나 뒤쪽인 것 조회)
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';

--급여가 2500 이상이고, 직업이 analyst 인 사원 조회

SELECT
    *
FROM
    emp
WHERE
        sal >= 2500
    AND job = 'analyst';

-- 직무가 MANAGER or  SALESMAN or CLECRK 조회
SELECT
    *
FROM
    emp
WHERE
    job = 'MANAGER'
    OR job = 'SALESMAN'
    OR job = 'CLERK';
    
    
-- job 이 'MANAGER' 아니고, 'SALESMAN' 아니고, 'CLERK'
SELECT
    *
FROM
    emp
WHERE
        job != 'MANAGER'
    AND job <> 'SALESMAN'
    AND job^= 'CLERK';
--NOT +IN
    
--등가비교 연산자 (같다:=, 같지않다 : !=,<>,^=)
--급여가 3000이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

--논리부정연산자
SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;
   
-- IN 연산자 : = 의 의미와 같음   
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'MANAGER', 'SALESMAN', 'CLERK' );
    
--Not + In
SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'MANAGER', 'SALESMAN', 'CLERK' );
    
-- In 을 사용해서 부서번호가 10, 20번인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );
   
-- BETWEEN A AND B  연산자 : 급여가 2000이상 3000 이하
SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

-- 급여가 2000 이상 3000 이하가 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자와 와일드 카드( _ : 어떤 값이든 상관없이 단 한개의 문자 데이터
--                           % 어떤 값이든 상관없고 길이와 상관없이 모든 문자 데이터)

--사원 이름이 S로 시작하는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

--사원 이름의 두번째 글자가 L 인 사원 정보 조회

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

-- 사원 이름에 AM 이 들어있는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

--사원 이름이 AM으로 끝나는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM';

-- 사원이름에 AM 이 들어있지 않는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';
   
--IS NULL 연산자
--COMM 이 null 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL; -- null 에는 =사용 못함

-- MGR 이 널이 아닌 사원 조회

SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;
    
-- 집합 연산자
-- union (합집합) , minus(차집합), intersect(교집합)
-- deptno=10 or deptno=20 사원 조회 : union 사용해서
-- union (중복값 제거 함) union all (중복 제거 안함)
SELECT
    empno,
    ename,
    job
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    job
FROM
    emp
WHERE
    deptno = 20;

--MINUS
SELECT
    empno,
    ename,
    job,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    job,
    deptno
FROM
    emp
WHERE
    deptno = 10;
    
--Intersect    
SELECT
    empno,
    ename,
    job,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    job,
    deptno
FROM
    emp
WHERE
    deptno = 10;
    
--[문제] 사원 이름(ename) 이 s로 끝나는 데이트를 출력한다.
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S';

--[문제]  30번 부서(deptno) 에서 근무하고 있는 사원 중에 직책(job)이
--salesman 인 사원의 사원번호, 이름, 직책, 급여, 부서 번호를 출력한다.
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';


--[문제] 20번, 30번 부서에 근무하고 있는 사원 중 급여(sal)가 2000 초과인
--사원을 다음 두 가지 방식의 select 문을 사용하여 사원번호, 이름, 직책, 급여,
-- 부서번호를 출력하는 sql 문을 작성해 보시오
-- 집합 연산자를 사용하지 않은 방식
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN ( 20, 30 )
    AND sal > 2000;

--집합 연산자를 사용한 방식
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN 20
    AND sal > 2000
UNION
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN 30
    AND sal > 2000;

--[문제] not between a and b 연산자를 쓰지 않고, 급여(sal) 열 값이
-- 2000 이상 30000 이하 범위 이외의 값을 가진 데이터만 출력하도록 sql 문을 작성하시오.
SELECT
    *
FROM
    emp
WHERE
    sal < 2000
    OR sal > 30000;

--[문제] 사원 이름에 E가 포함되에 있는 30번 부서의 사원 중 급여가 1000~2000 사이가
--아닌 사원 이름, 사원 번호, 급여, 부서 번호를 출력하는 sql문을 작성
SELECT
    ename,
    empno,
    sal,
    deptno
FROM
    emp
WHERE
    ename LIKE '%E%'
    AND deptno IN 30
    AND sal NOT BETWEEN 1000 AND 2000;

--[문제] 추가 수당이 존재하지 않고 상급자가 있고 직책이 manager, clerk 인 사원
--중에서 사원 이름의 두번째 글자가 L이 아닌 사원의 정보를 출력하는 sql 문을 작성
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
    AND job IN ( 'MANAGER', 'CLERK' )
    AND ename NOT LIKE '_L%'; 

-- 오라클 함수
-- 대소문자 변경 : Upper(), LOWER(), INITCAP()

SELECT
    ename,
    lower(ename)   AS 소문자,
    upper(ename)   AS 대문자,
    initcap(ename) AS 첫자만대문자
FROM
    emp;
    
-- dual : sys가 소유하는 테이블
--        임시 연산이나 함수의 결과값 확인하는 용도
    
-- 문자열 길이 : LENGTH / 문자열 바이트 수 반환: LENGTH
SELECT
    length('한글'),
    lengthb('한글'),
    length('ab'),
    lengthb('ab')
FROM
    dual;

SELECT
    ename,
    length(ename)
FROM
    emp;

--[실습] 직책 이름이 6글자 이상인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    length(job) >= 6;

-- 문자열 추출 : substr(원본데이터, 시작위치, 추출길이)

SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5)
FROM
    emp;
    
--[문제] emp 테이블의 모든 사원 이름을 세번째 글자부터 끝까지 출력
-- ename, 추출문자열

SELECT
    ename,
    substr(ename, 3)
FROM
    emp;
    
-- 문자열 데이터 안에서 특정 문자 위치 찾기: INSTR(문자열 데이터, 
-- 위치를 찾으려고 하는 부분 문자, 시작위치, 시작위치에서 찾으려는 문자가 몇번째인지 지정)
SELECT
    instr('HELLO ORACLE!', 'L')       AS instr1,
    instr('HELLO ORACLE!', 'L', 5)    AS instr2,
    instr('HELLO ORACLE!', 'L', 2, 2) AS instr3
FROM
    dual;
    
-- 사원이름에 s가 있는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    instr(ename, 'S') > 0;

--특정 문자를 다른 문자로 변경 : REPLACE(원본,찾는문자,바꿀문자)
SELECT
    '010-1234-5678'                    AS replace_before,
    replace('010-1234-5678', '-', ' ') AS replace1,
    replace('010-1234-5678', '-')      AS replace2
FROM
    dual;

-- 문자열 연결: CONCAT(문자1,문자2)
SELECT
    concat(empno, ename)
FROM
    emp;

SELECT
    concat(empno, concat(':', ename))
FROM
    emp;

-- 문자열 연결 : ||
SELECT
    empno || ename
FROM
    emp;

SELECT
    empno
    || ':'
    || ename
    || sal
FROM
    emp;

-- 특정 문자열 제거 (아무것도 안주면 공백제거) : TRIM(), LTRIM(), RTRIM()
SELECT
    '    이것이     ',
    TRIM('    이것이     '),
    ltrim('    이것이     '),
    rtrim('    이것이     ')
FROM
    dual;

--숫자함수
--round() :반올림, trunc() : 버림,
--ceil(): 지정된 숫자보다 큰 정수 중에서 가장 작은 정수
--floor() : 지정된 숫자보다 작은 정수 중에서 가장 큰 정수
-- mod(): 나머지

SELECT
    round(1234.5678)      AS round,
    round(1234.5678, 0)   AS round1,
    round(1234.5678, 1)   AS round2,
    round(1234.5678, 2)   AS round3,
    round(1234.5678, - 1) AS round4,
    round(1234.5678, - 2) AS round5
FROM
    dual;

SELECT
    trunc(1234.5678)      AS trunc,
    trunc(1234.5678, 0)   AS trunc1,
    trunc(1234.5678, 1)   AS trunc2,
    trunc(1234.5678, 2)   AS trunc3,
    trunc(1234.5678, - 1) AS trunc4,
    trunc(1234.5678, - 2) AS trunc5
FROM
    dual;

SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 3.14)
FROM
    dual;

SELECT
    mod(15, 6),
    mod(10, 2),
    mod(11, 2)
FROM
    dual;
    
-- 날짜 함수 : 연산이 가능함
-- sysdate, current_date, current_timestamp

SELECT
    sysdate,
    current_date,
    current_timestamp
FROM
    dual;

SELECT
    sysdate     AS now,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrow
FROM
    dual;


--add_months() : 몇개월 이후 날짜 구하기
SELECT
    sysdate,
    add_months(sysdate, 3)
FROM
    dual;
    
-- 입사 20주년이 되는 사원들 조회
SELECT
    empno,
    ename,
    hiredate,
    add_months(hiredate, 240)
FROM
    emp;
    
--현재 날짜를 기준으로 입사 45년 미만인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    add_months(hiredate, 540) > sysdate;
    
-- months_between(날짜1,날짜2):두 날짜 데이터 간의 날짜 차이를 개월 수로 출력
SELECT
    empno,
    ename,
    hiredate,
    sysdate,
    months_between(hiredate, sysdate)        AS months1,
    months_between(sysdate, hiredate)        AS months2,
    trunc(months_between(sysdate, hiredate)) AS months3
FROM
    emp;
    
-- next_day() : 특정 날짜를 기준으로 돌아오는 요일의 날짜 출력
-- last_day() : 특정 날짜가 속한 달의 마지막 날짜 출력
SELECT
    sysdate,
    next_day(sysdate, '월요일'),
    last_day(sysdate)
FROM
    dual;

--형변환 함수
SELECT
    empno,
    ename,
    empno + '500'
FROM
    emp
WHERE
    ename = 'smith';

desc emp;

SELECT
    empno,
    ename,
    'abcd' + empno
FROM
    emp
WHERE
    ename = 'smith';
    
-- TO_CHAR() : 숫자, 날짜 데이터를 문자 데이터로 변환
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환

SELECT
    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간
FROM
    dual;

SELECT
    to_char(sysdate, 'MM')    AS mm,
    to_char(sysdate, 'MON')   AS mon,
    to_char(sysdate, 'MONTH') AS month,
    to_char(sysdate, 'DD')    AS dd,
    to_char(sysdate, 'DY')    AS dy,
    to_char(sysdate, 'DAY')   AS day
FROM
    dual;

SELECT
    to_char(sysdate, 'HH24:MI:SS')    AS hh24miss,
    to_char(sysdate, 'HH24:MI:SS AM') AS hhmiss_am,
    to_char(sysdate, 'HH:MI:SS P.M.') AS hhmiss_pm,
    to_char(sysdate, 'HH:MI:SS')      AS hhmiss     --12시간
FROM
    dual;

SELECT
    1300 - '1500',
    '1300' + 1500
FROM
    dual;
    
--이렇게하면 에러뜸    
SELECT
    '1,300' + '1,500'
FROM
    dual;

--투넘버로 바꿔야함
-- 9 : 숫자 한자리를 의미함
SELECT
    to_number('1,300', '999,999') + to_number('1,500', '999,999')
FROM
    dual;

SELECT
    sal,
    to_char(sal, '$999,999') AS sal_$
FROM
    emp;

SELECT
    TO_DATE('2002-03-22', 'YYYY-MM-DD') AS date1,
    TO_DATE('20020322', 'YYYY-MM-DD')   AS date2
FROM
    dual;

--1981년 6월 1일 이후에 입사한 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    hiredate > TO_DATE('19810601', 'YYYY-MM-DD');


-- null 처리 함수
SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm
FROM
    emp;
    
-- nvl(널값 열, 널인경우 사용할 값)
SELECT
    empno,
    ename,
    sal,
    nvl(comm, 0),
    sal + nvl(comm, 0)
FROM
    emp;
    
-- nvl2(널값 열, 널이 아닐 경우 사용할 값, 널인경우 사용할 값) => nvl 개선버전
SELECT
    empno,
    ename,
    sal,
    nvl2(comm, 'O', 'X'),
    sal + nvl2(comm, sal * 12 + comm, sal * 12)
FROM
    emp;

-- decode 함수와 case 문
-- decode(대상이 될 열 혹은 데이터,
-- 조건1, 조건1과 일치시 반환할 결과
-- 조건2, 조건2과 일치시 반환할 결과
-- 조건 1~조건 n까지 만족 안할 때 반환할 결과)
-- job에 따라 비율을 다르게 준 다음 연산
SELECT
    empno,
    ename,
    job,
    sal,
    decode(job, 'MANAGER', sal * 1.1, 'SALESMAN', sal * 1.05,
           'ANALYST', sal, sal * 1.03) AS upsal
FROM
    emp;

SELECT
    empno,
    ename,
    job,
    sal,
    CASE job
        WHEN 'MANAGER'  THEN
            sal * 1.1
        WHEN 'SALESMAN' THEN
            sal * 1.05
        WHEN 'ANALYST'  THEN
            sal
        ELSE
            sal * 1.03
    END AS upsal
FROM
    emp;

SELECT
    empno,
    ename,
    job,
    sal,
    CASE
        WHEN comm IS NULL THEN
            '해당사항 없음'
        WHEN comm = 0 THEN
            '수당 없음'
        WHEN comm > 0 THEN
            '수당 :' || comm
    END AS comm_text
FROM
    emp;
    
--[실습]SQL작성 emp 테이블에서 월평균 근무일수 21.5 일 하루 8시간 근무
--하루급여(day_pay), 시급(time_pay)
-- day_pay 소수점 셋째자리에서 버리기
-- time_pay 소수점 둘째 자리에서 반올림

SELECT
    empno,
    ename,
    sal,
    trunc(sal / 21.5)     AS day_pay,
    round(sal / 21.5 / 8) AS time_pay
FROM
    emp;

--[실습] emp 테이블에서 hiredate 를 기준으로 3개월이 지난 후
--첫 월요일에 정직원이 된다. 사원들이 정직원이 되는 날짜(R_JOB)을
--YYYY-MM_DD 형식으로 출력하시오
--추가수당(COMM) 이 없는 사원의 추가수당은 N/A로 출력
SELECT
    comm,
    nvl(comm, 'n/a') --에러발생
FROM
    emp;

SELECT
    comm,
    nvl(to_char(comm), 'n/a')
FROM
    emp;

SELECT
    ename,
    hiredate,
    next_day(add_months(hiredate, 3), '월요일') AS r_job,
    nvl2(comm, to_char(comm), 'N/A')         AS comm
FROM
    emp;
    
--[실습] emp 테이블의 모든 사원을 대상으로 직속상사의 사원번호(MGR)
--을 다음과 같은 조건을 기준으로 변환해서 CHG_MGR 열에 출력하시오

SELECT
    empno,
    ename,
    decode(substr(to_char(mgr), 1, 2), NULL, '0000', '75', '5555',
           '76', '6666', '77', '7777', '78',
           '8888', substr(to_char(mgr), 1)) AS chg_mgr
FROM
    emp;

SELECT
    empno,
    ename,
    CASE
        WHEN mgr IS NULL THEN
            '0000'
        WHEN substr(to_char(mgr), 1, 2) = '75' THEN
            '5555'
        WHEN substr(to_char(mgr), 1, 2) = '76' THEN
            '6666'
        WHEN substr(to_char(mgr), 1, 2) = '77' THEN
            '7777'
        WHEN substr(to_char(mgr), 1, 2) = '78' THEN
            '8888'
        ELSE
            to_char(mgr)
    END AS chg_mgr
FROM
    emp;

--다중행 함수
-- sum(), count(), max(), min(), avg()

--추가수당 합계
SELECT
    SUM(comm)
FROM
    emp;

SELECT
    SUM(DISTINCT sal),
    SUM(sal)
FROM
    emp;

-- emp 테이블의 사원 수 출력
SELECT
    COUNT(*)
FROM
    emp;

-- 부서번호가 30번인 사원 수 출력
SELECT
    COUNT(*)
FROM
    emp
WHERE
    deptno = 30;

-- 급여의 최대값
SELECT
    MAX(sal)
FROM
    emp;

--급여의 최소값
SELECT
    MIN(sal)
FROM
    emp;
    
-- 부서번호가 20번인 사원 중 제일 오래된 입사일 구하기
SELECT
    MIN(hiredate)
FROM
    emp
WHERE
    deptno = 20;
    
-- 부서번호가 20번인 사원 중 제일 최근 입사일 구하기
SELECT
    MAX(hiredate)
FROM
    emp
WHERE
    deptno = 20;
    
-- 부서번호가 30번인 사원들의 급여 평균 출력
SELECT
    round(AVG(sal), 1)
FROM
    emp
WHERE
    deptno = 30;

--[문제] 회사 내의 최대 연봉 및 최소 연봉 차 출력
SELECT
    MAX(sal) - MIN(sal)
FROM
    emp;

--[문제] 매니저로 근무하는 사원들의 총 숫자 출력 중복 빼고
SELECT
    COUNT('MANAGER')
FROM
    emp;

-- 부서별 평균 급여 출력 : group by

SELECT
    deptno,
    AVG(sal) AS 평균급여 --ORA-00937: not a single-group group function
FROM
    emp;

-- group by : 결과값을 원하는 열로 묶어 출력

SELECT
    deptno,
    AVG(sal) AS 평균급여
FROM
    emp
GROUP BY
    deptno;
    
-- 부서별, 직책별 급여 평균 출력

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
ORDER BY
    deptno,
    job;

--group by : select 절에 group by 절에 포함안되는 열을 사용 불가
SELECT
    ename,
    deptno,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno;
    
-- group by ~ having : 그릅을 잡을 때 조건을 주는 경우

-- 각 부서의 직책별 평균 급여를 구하되, 평균 급여가 2000이상인 그룹만 출력
SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000;
    
-- where : 출력 대상 행을 제한
-- having : 그룹화 된 대상을 제한

-- emp 테이블의 부서별 직책의 평균급여가 500 이상인, 사원들의 부서번호, 직책
-- 평균급여 출력
SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 500
ORDER BY
    deptno,
    job;

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
WHERE -- group function is not allowed here
    AVG(sal) >= 500
GROUP BY
    deptno,
    job;

SELECT               --------------- 5번
    deptno,
    job,
    AVG(sal)
FROM                 --------------- 1번
    emp
WHERE                --------------- 2번
    sal <= 3000
GROUP BY             --------------- 3번
    deptno,
    job
HAVING               --------------- 4번
    AVG(sal) >= 2000
ORDER BY             --------------- 6번
    deptno,
    job;
    
--[실습1] emp 테이블을 이용하여 deptno, avg_sal, max_sal, min_sal, cnt(사원수)
-- 를 출력한다. 평균급여는 소수점 없애고 부서번호별로 출력
SELECT
    deptno,
    round(AVG(sal)) AS avg_sal,
    MAX(sal)        AS max_sal,
    MIN(sal)        AS min_sal,
    COUNT(deptno)   AS cnt
FROM
    emp
GROUP BY
    deptno
ORDER BY
    deptno;
    
--[실습2] 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수를 출력하는 SQL문 작성
SELECT
    job        AS 직책,
    COUNT(job) AS 사원수
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(job) >= 3;
    
--[실습3] 사원들의 입사연도 hire_date 를 기준으로 부서별로 몇명이 입사했는지 출력
SELECT
    to_char(hiredate, 'YYYY') AS hire_year,
    deptno,
    COUNT(*)                  AS cnt
FROM
    emp
GROUP BY
    to_char(hiredate, 'YYYY'),
    deptno;

    
-- join
-- 데이터가 여러 개의 테이블에 나뉘어 저장됨
SELECT
    *
FROM
    emp;

SELECT
    *
FROM
    dept;

--join
--1) 내부조인 (INNER JOIN) 같은 테이블이 있어야함 교집합
--2) 외부조인 (OUTER JOIN) 
--(1)left outer join (2)right outer join (3) full outer join

-- 1) 내부조인(등가조인) : 일치하는 컬럼을 기준으로 값 가져오기
-- column ambiguously defined
SELECT
    e.empno,
    e.ename,
    e.deptno,
    dname,
    loc
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno;
    
-- 표준문법 (inner 생략가능)
SELECT
    e.empno,
    e.ename,
    e.deptno,
    dname,
    loc
FROM
         emp e
    INNER JOIN dept d ON e.deptno = d.deptno;
    
-- 부서번호가 일치하는 사원들의 정보 출력
-- 급여가 3000 이상인 사원들만 출력

SELECT
    e.empno,
    e.ename,
    e.deptno,
    dname,
    sal,
    loc
FROM
         emp e
    INNER JOIN dept d ON e.deptno = d.deptno
                         AND sal >= 3000;

-- 부서번호가 일치하는 사원들의 정보 출력
-- 급여가 2500 이하이고, 사원번호가 9999 이하인 사원 출력

SELECT
    e.empno,
    e.ename,
    e.deptno,
    d.dname,
    d.loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND e.sal <= 2500
    AND e.empno <= 9999;

SELECT
    e.empno,
    e.ename,
    e.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
                   AND e.sal <= 2500
                   AND e.empno <= 9999;
    
    
-- emp, salgrade 조인 : 비등가join

SELECT
    *
FROM
    salgrade;

SELECT
    empno,
    ename,
    job,
    sal,
    comm,
    deptno,
    grade
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;
    
-- 자기자신 테이블 조인 : 셀프조인

SELECT
    *
FROM
    emp;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno;
    
-- outer join (외부조인)
-- left outer join
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1
    LEFT OUTER JOIN emp e2 ON e1.mgr = e2.empno;

-- right outer join
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1
    RIGHT OUTER JOIN emp e2 ON e1.mgr = e2.empno;
    
--[문제] 각 부서별 평균급여, 최대급여, 최소급여, 사원수 출력
-- 부서코드, 부서명, 평균급여, 최대급여, 최소급여, 사원수 출력

SELECT
    d.dname,
    d.deptno,
    round(AVG(sal)),
    MAX(sal),
    MIN(sal),
    COUNT(empno)
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
GROUP BY
    d.dname,
    d.deptno;

SELECT
    *
FROM
    dept;

--[문제] 모든 부서정보와 사원 정보를 출력( 부서번호의 오름차순, 사원번호의 오름차순)
--부서번호, 부서명, 사원번호, 사원, 직책, 급여

SELECT
    d.deptno,
    d.dname,
    e.empno,
    e.ename,
    e.job,
    e.sal
FROM
    emp  e
    RIGHT OUTER JOIN dept d ON e.deptno = d.deptno
ORDER BY
    d.deptno,
    e.empno;
    
-- 세 개의 테이블 조인
SELECT
    e1.empno,
    e2.empno,
    e3.empno
FROM
         emp e1
    JOIN emp e2 ON e1.empno = e2.empno
    JOIN emp e3 ON e2.empno = e3.empno;
    
--[문제] 모든 부서정보와 사원정보, 급여등급정보, 각 사원의 직속 상ㅇ\관의 정보 부서번호,
--사원번호 순으로 정렬하여 출력하는 sql문을 작성하시오

SELECT
    d.deptno,
    d.dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    e1.deptno AS deptno_1,
    s.losal,
    s.hisal,
    s.grade,
    e2.empno  AS mgr_empno,
    e2.ename  AS mgr_ename
FROM
    emp      e1
    RIGHT OUTER JOIN dept     d ON e1.deptno = d.deptno
    LEFT OUTER JOIN salgrade s ON e1.sal BETWEEN s.losal AND s.hisal
    LEFT OUTER JOIN emp      e2 ON e1.mgr = e2.empno
ORDER BY
    d.deptno,
    e1.empno;
    
-- 서브 쿼리 : 쿼리문 안에 또다른 쿼리문 존재
-- select 조회할 열
-- from 테이블명
-- where 조건식 (select 조회할 열 from 테이블명 where 조건식)

--jones 사원의 급여보다 높은 급여를 받는 사원 조회
SELECT
    sal
FROM
    emp
WHERE
    ename = 'JONES'; --2975

SELECT
    *
FROM
    emp
WHERE
    sal > 2975;

SELECT
    *
FROM
    emp
WHERE
    sal > (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename = 'JONES'
    );
    
    
-- Allen 사원의 추가 수당보다 많은 추가 수당을 받는 사원
SELECT
    *
FROM
    emp
WHERE
    comm > (
        SELECT
            comm
        FROM
            emp
        WHERE
            ename = 'ALLEN'
    );

-- 'WARD' 보다 빨리 입사한 사원정보 조회
SELECT
    *
FROM
    emp
WHERE
    hiredate < (
        SELECT
            hiredate
        FROM
            emp
        WHERE
            ename = 'WARD'
    );
    
-- 실행결과가 하나로 나오는 단일행 서브쿼리 사용연산자
-- >,<=, =, <=, <>,^=,!=

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는
-- 사원 정보와 소속부서 정보를 조회

SELECT
    e.empno,
    e.ename,
    e.job,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        d.deptno = 20
    AND e.sal > (
        SELECT
            AVG(sal)
        FROM
            emp
    );
    
-- 실행결과가 여러개로 나오는 다중행 서브쿼리 사용연산자
-- IN, ANY(SOME), ALL, EXISTS
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 20, 30 );

-- IN : 메인쿼리의 데이터가 서브쿼리 결과 중 하나라도 일치한 데이터가 있다면 true

-- 각 부서별 최고 급여와 동일한 급여를 받는 사원 정보 출력
SELECT
    *
FROM
    emp
WHERE
    sal IN (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );

-- ANY(SOME) : 서브쿼리가 반환한 여러 결과 값 중에서 메인쿼리의 조건식 중 하나라도
-- true 라면 메인쿼리 조건식을 true 로 반환
    
-- in == =any    
SELECT
    *
FROM
    emp
WHERE
    sal = ANY (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );
    
-- 각 부서별 최고 급여보다 작은 급여를 받는 사원 정보 출력
SELECT
    *
FROM
    emp
WHERE
    sal < ANY (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );
    
--30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 정보 출력

SELECT
    *
FROM
    emp
WHERE
    sal > ANY (
        SELECT DISTINCT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );
    
--30번 부서 사원들의 최소 급여보다 적은 급여를 받는 사원 정보 출력
--ALL : 서브쿼리가 반환한 여러 결과 값을 메인쿼리의 조건식이 모두만족해야 true로 반환

SELECT
    *
FROM
    emp
WHERE
    sal < ALL (
        SELECT DISTINCT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );
    
    
-- 다중열 서브쿼리
-- 자신의 부서 내에서 최고 연봉과 동일한 급여를 받는 사원
SELECT
    *
FROM
    emp
WHERE
    ( deptno, sal ) IN (
        SELECT
            deptno, MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );
    
    
-- from 절에 사용하는 서브쿼리(인라인뷰)

SELECT
    e10.empno,
    e10.ename,
    e10.deptno,
    d.dname,
    d.loc
FROM
    (
        SELECT
            *
        FROM
            emp
        WHERE
            deptno = 10
    ) e10,
    (
        SELECT
            *
        FROM
            dept
    ) d
WHERE
    e10.deptno = d.deptno;
    
--[문제] 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진
-- 사원정보, 부서정보를 출력(not in)

SELECT
    e.empno,
    e.ename,
    e.job,
    e.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        e.deptno = 10
    AND job NOT IN (
        SELECT
            job
        FROM
            emp
        WHERE
            deptno = 30
    );


--[문제] 직책이 SALESMAN 인 사람들의 최고급여보다 높은 급여를 받는 사원들의
--사원정보, 급여 등급 정보를 출력
-- EMPNO, ENAME, SAL, GRADE 출력
-- MAX를 쓰는형태
SELECT
    e.empno,
    e.ename,
    e.sal,
    s.grade
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE
    sal > (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            job = 'SALESMAN'
    );

-- MAX를 안쓰는형태

SELECT
    e.empno,
    e.ename,
    e.sal,
    s.grade
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE
    sal > ALL (
        SELECT
            sal
        FROM
            emp
        WHERE
            job = 'SALESMAN'
    );
    
-- DML (데이터 조작어 : 삽입, 삭제, 수정)
-- commit(커밋):데이터베이스에 최종 반영,
-- rollback(롤백):지금 반영된걸 취소, 

-- dept 테이블의 데이터를 추출하여 dept_temp 테이블 생성
CREATE TABLE dept_temp
    AS
        SELECT
            *
        FROM
            dept;
            
-- insert(삽입)
-- insert into 테이블명(열이름...)
-- values(데이터....)

-- 문자, 날짜 데이터는 ''사용
INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    50,
    'DATABASE',
    'SEOUL'
);

INSERT INTO dept_temp VALUES (
    60,
    'NETWORK',
    'BUSAN'
);

INSERT INTO dept_temp (
    deptno,
    dname
) VALUES (
    70,
    'NETWORK'
);

--insert into dept_temp
--values (800,'NETWORK','BUSAN');

INSERT INTO dept_temp VALUES (
    80,
    'NETWORK',
    NULL
);

SELECT
    *
FROM
    dept_temp;

-- emp 테이블의 구조만 복사해서 새로운 테이블 생성 (데이터는 안가져옴)  WHERE 1 <> 1
CREATE TABLE emp_temp
    AS
        SELECT
            *
        FROM
            emp
        WHERE
            1 <> 1;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    9999,
    '홍길동',
    'MANAGER',
    NULL,
    '2021-01-05',
    5000,
    1000,
    10
);

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    8888,
    '성춘향',
    'MANAGER',
    9999,
    sysdate,
    4000,
    500,
    20
);

-- emp 테이블에서 부서번호가 20번인 사원들만 emp_temp 로 삽입

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
)
    SELECT
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno
    FROM
        emp
    WHERE
        deptno = 20;

-- emp 테이블에서 salgrade 테이블을 참조하여 등급이 1인 사원을
-- emp_temp 에 추가하과 싶을때

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
)
    SELECT
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno
    FROM
             emp e
        JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
    WHERE
        s.grade = 1;

SELECT
    *
FROM
    emp_temp;

-- 수정
-- update 테이블명
-- set 변경할열 =값, 변경할열 = 값
-- [where] 선택

SELECT
    *
FROM
    dept_temp; --확인용

-- loc 를 seoul 로 변경
UPDATE dept_temp
SET
    loc = 'SEOUL';
    
-- deptno=50인 경우에 loc를 부산으로 변경
UPDATE dept_temp
SET
    loc = 'BUSAN'
WHERE
    deptno = 50;

ROLLBACK;

SELECT
    *
FROM
    dept_temp; --확인용
    
--emp_temp 사원중 sal 3000 이하인 사원만 comm 300으로 수정
UPDATE emp_temp
SET
    comm = 300
WHERE
    sal <= 3000;

SELECT
    *
FROM
    emp_temp;
    
--update 서브쿼리

UPDATE emp_temp
SET
    sal = 1500
WHERE
    empno = 7369;

--dept 테이블에서 부서번호가 40번인 부서명과 지역 추출
UPDATE dept_temp
SET
    ( dname,
      loc ) = (
        SELECT
            dname,
            loc
        FROM
            dept
        WHERE
            deptno = 40
    );
    
-- dname 이 operations 인 부서번호 추출
-- 추출된 부서번호와 일치하는 부서번호의 지역을 'SEOUL' 로 변경
UPDATE dept_temp
SET
    loc = 'SEOUL'
WHERE
    deptno = (
        SELECT
            deptno
        FROM
            dept
        WHERE
            dname = 'OPERATIONS'
    );

SELECT
    *
FROM
    dept_temp;

ROLLBACK;

COMMIT;

--삭제
--delte [from]
--[where] 프롬이나 웨어는 선택적
SELECT
    *
FROM
    emp_temp;

--job이 analyst 인 사원 삭제
DELETE FROM emp_temp
WHERE
    job = 'ANALYST';

DELETE emp_temp;

-- emp_temp 에서 급여등급이 3이고, 20번 부서의 사원만 삭제
DELETE FROM emp_temp
WHERE
    empno IN (
        SELECT
            empno
        FROM
                 emp_temp e
            JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
        WHERE
                s.grade = 3
            AND e.deptno = 20
    );

SELECT
    *
FROM
    emp_temp;

ROLLBACK;

COMMIT;


--[실습1] 실습을 위하여 기존 테이블을 이요하여 테이블을 생성한다.
--1. emp 테이블의 내용을 이용하여 exam_emp 생성
CREATE TABLE exam_emp
    AS
        SELECT
            *
        FROM
            emp;
--2. dept 테이블의 내용을 이용하여 exam_dept 생성
CREATE TABLE exam_dept
    AS
        SELECT
            *
        FROM
            dept;
--3. salgrade 테이블의 내용을 이용하여 exam_salgrade 생성
CREATE TABLE exam_salgrade
    AS
        SELECT
            *
        FROM
            salgrade;
            
--[실습2] 다음의 정보를 exam_emp 테이블에 입력하시오
DELETE exam_emp;

SELECT
    *
FROM
    exam_emp;

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7201,
    'test_user1',
    'MANAGER',
    7788,
    '2016-01-02',
    4500,
    NULL,
    50
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7202,
    'test_user2',
    'CLERK',
    7201,
    '2016-02-21',
    1800,
    NULL,
    50
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7203,
    'test_user3',
    'ANALYST',
    7201,
    '2016-04-11',
    3400,
    NULL,
    60
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7204,
    'test_user4',
    'SALESMAN',
    7201,
    '2016-05-31',
    2700,
    300,
    60
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7205,
    'test_user5',
    'CLERK',
    7201,
    '2016-07-20',
    2600,
    NULL,
    70
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7206,
    'test_user6',
    'CLERK',
    7201,
    '2016-09-08',
    2600,
    NULL,
    70
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7207,
    'test_user7',
    'LECTURER',
    7201,
    '2016-10-28',
    2300,
    NULL,
    80
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7208,
    'test_user8',
    'STUDENT',
    7201,
    '2018-03-09',
    1200,
    NULL,
    80
);

--[실습3] EXAM_EMP에 속한 사원 중 50번 부서에서 근무하는 사원들의 평균 급여보다
--많은 급여를 받고있는 사원들을 70번 부서로 옮기는 SQL문 작성
UPDATE exam_emp
SET
    deptno = 70
WHERE
    sal > (
        SELECT
            AVG(sal)
        FROM
            exam_emp
        WHERE
            deptno = 50
    );

--[실습4] EXAM_EMP에 속한 사원 중 60번 부서의 사원 중에서 입사일이 가장 빠른
--사원보다 늦게 입사한 사원의 급여를 10% 인상하고 80번 부서로 옮기는 SQL문 작성
UPDATE exam_emp
SET
    sal = sal * 1.1,
    deptno = 80
WHERE
    hiredate > ANY (
        SELECT
            MIN(hiredate)
        FROM
            exam_emp
        WHERE
            deptno = 60
    );


--[실습3] EXAM_EMP에 속한 사원 중, 급여 등급이 5인 사원을 삭제하는 SQL문 작성

DELETE FROM exam_emp
WHERE
    empno IN (
        SELECT
            empno
        FROM
                 exam_emp e
            JOIN exam_salgrade s ON e.sal BETWEEN s.losal AND s.hisal
        WHERE
            s.grade = 5
    );

SELECT
    *
FROM
    exam_emp;

ROLLBACK;

COMMIT;

-- 트랜잭션 : 관계형 데이터베이스에서 하나의 작업 또는 밀접하게 관련되어 있는
--작업 수행을 위해 나눌 수 없는 최소 수행 단위(한번에 이루어져야하는 작업)

CREATE TABLE dept_tcl
    AS
        SELECT
            *
        FROM
            dept;

SELECT
    *
FROM
    dept_tcl;

-------------------------트랜잭션과 관련있는 명령어
INSERT INTO dept_tcl VALUES (
    50,
    'DATABASE',
    'SEOUL'
);

UPDATE dept_tcl
SET
    loc = 'BUSAN'
WHERE
    deptno = 40;

DELETE FROM dept_tcl
WHERE
    dname = 'RESEARCH';
------------------------------하나의 트랜잭션

ROLLBACK;

COMMIT;

-- 세션(session ) : 어떤 활동을 위한 시간이나 기간
-- 데이터베이스 세션 : 데이터베이스 접속을 시작으로 여러 데이터베이스에서 작업을 수행 한 후 접속종료

DELETE FROM dept_tcl
WHERE
    deptno = 50;

COMMIT;

UPDATE dept_tcl
SET
    loc = 'SEOUL'
WHERE
    deptno = 30;

COMMIT;

SELECT
    *
FROM
    dept_tcl;

-- DDL(데이터 정의어) : 생성(CREATE, 변경(ALTER), 삭제(DROP)

-- 테이블 직접 생성
--create table 테이블명(
--    열이름 자료형,
--    열이름 자료형,
--    열이름 자료형,
--    열이름 자료형);

-- 테이블명 규칙
-- 문자로 시작
-- 같은 사용자 소유의 테이블명 중복 불가
-- 영문자(한글 가능), 특수문자 가능($,#,_)
-- SQL 키워드(SELECT,DELETE.. 는 테이블명 사용불가

-- 자료형
-- 문자 : 
-- CHAR(n) - 고정길이 ex) name char(10); => 3 =>10 영어10개 한글이면3개 (한글1자에 3바이트)
-- VARCHAR2(n) -- 가변길이 ex) name varchar2(10); =>3
-- NCHAR(n) -- 고정길이(유니코드) ex) name char(10); 한글/영어 모두 10개의 문자를 쓰겠다
-- NVARCHAR2(n) -- 가변길이(유니코드) 

--숫자형
-- NUMBER(숫자1,숫자2) -- 숫자1 = 자리수,숫자2=소수점자리수
-- ex) empno number(4) : 숫자로 4자리 허용
-- price number (7,2) : 숫자로 7자리 허용되는데 (소수점이 들어온다면 2자리 허용)
-- job number : 숫자 지정을 안해줘도됨 저장데이터 크기에 맞게 자동 조절

--날짜형
--DATE : 년,월,일,시,분,초
--TIMESTAMP : 년,월,일,시,분,초 + 밀리초 입력가능

CREATE TABLE emp_ddl (
    empno    NUMBER(4),
    ename    VARCHAR2(10),
    job      VARCHAR2(9),
    mgr      NUMBER(4),
    hiredate DATE,
    sal      NUMBER(7, 2),
    comm     NUMBER(7, 2),
    deptno   NUMBER(2)
);

DROP TABLE emp_ddl;
      
--다른 테이블 구조 이용해서 생성(데이터 까지 포함)      
CREATE TABLE emp_ddl
    AS
        SELECT
            *
        FROM
            emp;

--다른 테이블 구조 이용해서 생성(데이터 미포함)    
CREATE TABLE emp_ddl1
    AS
        SELECT
            *
        FROM
            emp
        WHERE
            1 <> 1;

-- 테이블 변경 : ALTER

SELECT
    *
FROM
    emp_ddl;

--열 (컬럼)추가
ALTER TABLE emp_ddl ADD hp VARCHAR2(20);

--열 이름을 변경 : rename
ALTER TABLE emp_ddl RENAME COLUMN hp TO tel;

--열 자료형 변경 : modify
ALTER TABLE emp_ddl MODIFY
    empno NUMBER(5);

desc emp_ddl;

--데이터가 삽입되어 있을 때는 데이터의 길이와 맞지 않는다면 변경 불가
ALTER TABLE emp_ddl MODIFY
    empno NUMBER(3);

--열 삭제 : drop column
ALTER TABLE emp_ddl DROP COLUMN tel;

--테이블 명 변경 : rename
RENAME emp_ddl TO emp_rename;

--테이블 삭제 : drop
DROP TABLE emp_rename;

--[실습1] emp_hw 테이블 작성
CREATE TABLE emp_hw (
    id     CHAR(8),
    name   VARCHAR2(10),
    addr   NVARCHAR2(50),
    nation CHAR(4),
    email  VARCHAR2(50),
    age    NUMBER(7, 2)
);

desc emp_hw;

--[실습2] emp_hw 테이블 변경
ALTER TABLE emp_hw ADD bigo VARCHAR2(20);

ALTER TABLE emp_hw MODIFY
    bigo VARCHAR2(30);

ALTER TABLE emp_hw RENAME COLUMN bigo TO remark;


-- 제약조건(테이블의 특정 열에 지정)
-- 입력,수정,삭제 영향을 주는 부분 => 데이터의 무결성(정확성,일관성) 유지
-- 1) not null : 지정한 열에 null 을 허용하지 않음
-- 2) UNIQUE :지정한 열이 유일한 값을 가져야 함 (null 제외)
-- 3) PRIMARY KEY : 지정한 열이 유일값이면서 null 이 아님 (하나만 지정)
-- 4) FROEIGN KEY : 다른 테이블의 열을 참조하여 존재하는 값만 입력 가능
-- 5) CHECK : 설정한 조건식을 만족하는 데이터만 입력 가능

-- 1) not null : 지정한 열에 null 을 허용하지 않음
CREATE TABLE table_notnull (
    login_id  VARCHAR2(20) NOT NULL,
    login_pwd VARCHAR2(20) NOT NULL,
    tel       VARCHAR2(20)
);

INSERT INTO table_notnull (
    login_id,
    login_pwd,
    tel
) VALUES (
    'test_id_01',
    NULL,
    '010-1234-5678'
);
--ORA-01400: cannot insert NULL into ("SCOTT"."TABLE_NOTNULL"."LOGIN_PWD")

INSERT INTO table_notnull (
    login_id,
    tel
) VALUES (
    'test_id_01',
    '010-1234-5678'
);
--ORA-01400: cannot insert NULL into ("SCOTT"."TABLE_NOTNULL"."LOGIN_PWD")

INSERT INTO table_notnull (
    login_id,
    login_pwd
) VALUES (
    'test_id_01',
    '12345'
);

UPDATE table_notnull
SET
    login_pwd = NULL
WHERE
    login_id = 'test_id_01';

-- scott 가 사용한 모든 제약조건 확인
SELECT
    *
FROM
    user_constraints;

-- 제약조건명 지정
CREATE TABLE table_notnull2 (
    login_id  VARCHAR2(20)
        CONSTRAINT tblnn2_lgnid_nn NOT NULL,
    login_pwd VARCHAR2(20)
        CONSTRAINT tblnn2_lgnpwd_nn NOT NULL,
    tel       VARCHAR2(20)
);

--table_notnull tel 컬럼을 not null 제약 조건 추가
desc table_notnull;

SELECT
    *
FROM
    table_notnull;

ALTER TABLE table_notnull MODIFY (
    tel NOT NULL
);

UPDATE table_notnull
SET
    tel = '010-1234-5678'
WHERE
    login_id = 'test_id_01';

--제약조건 이름 변경
ALTER TABLE table_notnull2 RENAME CONSTRAINT tblnn2_lgnid_nn TO tblnn2_id_nn;

--제약조건 삭제
ALTER TABLE table_notnull2 DROP CONSTRAINT tblnn2_id_nn;

-- 2) UNIQUE :지정한 열이 유일한 값을 가져야 함 (null 제외)
CREATE TABLE table_ubique (
    login_id  VARCHAR2(20) UNIQUE,
    login_pwd VARCHAR2(20) NOT NULL,
    tel       VARCHAR2(20)
);

SELECT
    *
FROM
    table_ubique;

RENAME table_ubique TO table_unique;

INSERT INTO table_unique (
    login_id,
    login_pwd,
    tel
) VALUES (
    'test_id_01',
    12345,
    '010-1234-5678'
);

INSERT INTO table_unique (
    login_id,
    login_pwd,
    tel
) VALUES (
    'test_id_01',
    54321,
    '010-1234-5678'
);
--ORA-00001: unique constraint (SCOTT.SYS_C007010) violated

INSERT INTO table_unique (
    login_id,
    login_pwd,
    tel
) VALUES (
    NULL,
    54321,
    '010-1234-5678'
);

--unique 제약조건 이름 지정
CREATE TABLE table_unique2 (
    login_id  VARCHAR2(20)
        CONSTRAINT tblunq2_lgnid_unq UNIQUE,
    login_pwd VARCHAR2(20)
        CONSTRAINT tblunq2_lgnpwd_nn NOT NULL,
    tel       VARCHAR2(20)
);

--table_notnull tel 컬럼을 not null 제약 조건 추가
ALTER TABLE table_unique2 MODIFY (
    tel unique
);

-- 3) PRIMARY KEY : 지정한 열이 유일값이면서 null 이 아님 (하나만 지정)
-- not null + unique 
-- 각 행을 식별하는 용도

CREATE TABLE table_pk (
    login_id  VARCHAR2(20) PRIMARY KEY,
    login_pwd VARCHAR2(20) NOT NULL,
    tel       VARCHAR2(20)
);

INSERT INTO table_pk VALUES (
    'test_01',
    'pw01',
    '010-1234-5678'
);

CREATE TABLE table_pk2 (
    login_id  VARCHAR2(20) PRIMARY KEY,
    login_pwd VARCHAR2(20) PRIMARY KEY,
    tel       VARCHAR2(20)
);
--table can have only one primary key

CREATE TABLE table_pk2 (
    login_id  VARCHAR2(20)
        CONSTRAINT tblpk2_lgnid_pk PRIMARY KEY,
    login_pwd VARCHAR2(20)
        CONSTRAINT tblpk2_lgpwd_nn NOT NULL,
    tel       VARCHAR2(20)
);

--제약조건 지정시 다른 방식
CREATE TABLE table_con (
    col1 VARCHAR2(20),
    col2 VARCHAR2(20),
    PRIMARY KEY ( col1 ),
    CONSTRAINT tblcon_unq UNIQUE ( col2 )
);

-- 4) FROEIGN KEY : 다른 테이블의 열을 참조하여 존재하는 값만 입력 가능
CREATE TABLE dept_fk (
    deptno NUMBER(2)
        CONSTRAINT deptfk_deptfk_deptno_pk PRIMARY KEY,
    dname  VARCHAR2(20),
    loc    VARCHAR2(13)
);

CREATE TABLE emp_fk (
    empno  NUMBER(4)
        CONSTRAINT empfk_empno_pk PRIMARY KEY,
    enmae  VARCHAR2(10),
    deptno NUMBER(2)
        CONSTRAINT empfk_deptno_fk
            REFERENCES dept_fk ( deptno )
);

INSERT INTO emp_fk (
    empno,
    ename,
    deptno
) VALUES (
    7899,
    'hong',
    20
);

--외래키 수행순서
-- 부모테이블에 데이터가 먼저 삽입되어야 함
-- 자식테이블 데이터 삽입

INSERT INTO dept_fk VALUES (
    10,
    'DATABASE',
    'SEOUL'
);

INSERT INTO emp_fk (
    empno,
    enmae,
    deptno
) VALUES (
    7899,
    'hong',
    10
);

--child record found
DELETE FROM dept_fk
WHERE
    deptno = 10;

--외래키 삭제 수행 순서
-- 자식 테이블에 해당하는 데이터 삭제
-- 부모 테이블에 해당하는 데이터 삭제

--child record found
DELETE FROM emp_fk
WHERE
    deptno = 10;

DELETE FROM dept_fk
WHERE
    deptno = 10;

-- 부모 데이터를 삭제할 때 참조하고 있는 데이터도 함께 삭제
-- 부모 데이터를 삭제할 때 참조하고 있는 데이터를 null 로 수정

CREATE TABLE dept_fk2 (
    deptno NUMBER(2)
        CONSTRAINT deptfk_deptfk2_deptno_pk PRIMARY KEY,
    dname  VARCHAR2(20),
    loc    VARCHAR2(13)
);

-- on delete cascade : 열 데이터 삭제시 참조데이터 함께 삭제
CREATE TABLE emp_fk2 (
    empno  NUMBER(4)
        CONSTRAINT empfk2_empno_pk PRIMARY KEY,
    ename  VARCHAR2(10),
    deptno NUMBER(2)
        CONSTRAINT empfk2_deptno_fk
            REFERENCES dept_fk2 ( deptno )
                ON DELETE CASCADE
);

INSERT INTO dept_fk2 VALUES (
    10,
    'DATABASE',
    'SEOUL'
);

INSERT INTO emp_fk2 (
    empno,
    ename,
    deptno
) VALUES (
    7899,
    'hong',
    10
);

DELETE FROM dept_fk2
WHERE
    deptno = 10;

SELECT
    *
FROM
    emp_fk2;

SELECT
    *
FROM
    dept_fk2;

-- on delete set null : 열 데이터 삭제시 참조 데이터를 null로 수정
CREATE TABLE dept_fk3 (
    deptno NUMBER(2)
        CONSTRAINT deptfk_deptfk3_deptno_pk PRIMARY KEY,
    dname  VARCHAR2(20),
    loc    VARCHAR2(13)
);

CREATE TABLE emp_fk3 (
    empno  NUMBER(4)
        CONSTRAINT empfk3_empno_pk PRIMARY KEY,
    ename  VARCHAR2(10),
    deptno NUMBER(2)
        CONSTRAINT empfk3_deptno_fk
            REFERENCES dept_fk3 ( deptno )
                ON DELETE SET NULL
);

INSERT INTO dept_fk3 VALUES (
    10,
    'DATABASE',
    'SEOUL'
);

INSERT INTO emp_fk3 (
    empno,
    ename,
    deptno
) VALUES (
    7899,
    'hong',
    10
);

DELETE FROM dept_fk3
WHERE
    deptno = 10;

SELECT
    *
FROM
    emp_fk3;

SELECT
    *
FROM
    dept_fk3;

-- 5) CHECK : 설정한 조건식을 만족하는 데이터만 입력 가능
CREATE TABLE tbl_check (
    login_id  VARCHAR2(20)
        CONSTRAINT tblck_lgnid_pk PRIMARY KEY,
    login_pwd VARCHAR2(20)
        CONSTRAINT tblck_lgnpwd_ck CHECK ( length(login_pwd) > 3 ),
    tel       VARCHAR2(20)
);

INSERT INTO tbl_check VALUES (
    'test_id1',
    '123',
    '010-1234-5678'
);

INSERT INTO tbl_check VALUES (
    'test_id1',
    '1234',
    '010-1234-5678'
);

-- 기본값 지정 : default 
CREATE TABLE tbl_default (
    login_id  VARCHAR2(20)
        CONSTRAINT tbl_lgnid_pk PRIMARY KEY,
    login_pwd VARCHAR2(20) DEFAULT '1234',
    tel       VARCHAR2(20)
);

INSERT INTO tbl_default VALUES (
    'test_id1',
    'null',
    '010-1234-5678'
);

SELECT
    *
FROM
    tbl_default;

INSERT INTO tbl_default (
    login_id,
    tel
) VALUES (
    'test_id2',
    '010-1234-5678'
);

--[실습1] dept_const 테이블과 emp_const 테이블을 다음과 같은 특성 및 제약조건을
-- 지정하여 생성하시오

CREATE TABLE dept_const (
    deptno NUMBER(2)
        CONSTRAINT deptconst_deptno_pk PRIMARY KEY,
    dname  VARCHAR2(14)
        CONSTRAINT deptconst_deptno_unq UNIQUE,
    loc    VARCHAR2(13)
        CONSTRAINT deptconst_loc_nn NOT NULL
);

--create table dept_const2 (
--deptno number(2),
--dname varchar2(14),
--loc varchar2(13),
--constraint deptconst2_deptno_pk primary key(deptno),
--constraint deptconst2_deptno_unq unique(dname),
--constraint deptconst2_loc_nn not null(loc));

CREATE TABLE emp_const (
    empno    NUMBER(2)
        CONSTRAINT empconst_empno_pk PRIMARY KEY,
    ename    VARCHAR2(10)
        CONSTRAINT empconst_ename_nn NOT NULL,
    job      VARCHAR(9),
    tel      VARCHAR(20)
        CONSTRAINT empconst_tel_unq UNIQUE,
    hiredate DATE,
    sal      NUMBER(7, 2)
        CONSTRAINT empconst_sal_chk CHECK ( sal BETWEEN 1000 AND 9999 ),
    comm     NUMBER(7, 2),
    deptno   NUMBER(2)
        CONSTRAINT empconst_deptno_fk
            REFERENCES dept_const ( deptno )
);

COMMIT;

-- 시퀀스 (sequence) : 규칙에 따라 순번을 생성

-- 1씩 증가
CREATE SEQUENCE dept_seq;

CREATE TABLE dept_sequence
    AS
        SELECT
            *
        FROM
            dept
        WHERE
            1 <> 1;

SELECT
    *
FROM
    dept_sequence;

INSERT INTO dept_sequence (
    deptno,
    dname,
    loc
) VALUES (
    dept_seq.NEXTVAL,
    'DATABASE',
    'SEOUL'
);

-- 가장 마지막으로 생성도니 시퀀스 확인
SELECT
    dept_seq.CURRVAL
FROM
    dual;

DROP SEQUENCE dept_seq;

create sequence dept_seq
increment by 10-- 시퀀스에서 생성할 번호의 증가값
start with 10 --시퀀스에서 생성할 번호의 시작값
maxvalue 90 -- 시퀀스에서 생성할 번호의 최댓값
minvalue 0 -- 시퀀스에서 생성할 번호의 최소값
nocycle -- 시퀀스에서 생성한 번호가 최대값에 도달할 경우 다시 시작할 것인가 여부(cycle or nocycle)
cache 2; -- 시퀀스가 생성할 번호를 메모리에 미리 할당해 놓은 수를 지정

INSERT INTO dept_sequence (
    deptno,
    dname,
    loc
) VALUES (
    dept_seq.NEXTVAL,
    'DATABASE',
    'SEOUL'
);

SELECT
    *
FROM
    dept_sequence;
    
-- 시퀀스 수정
alter sequence dept_seq increment by 3 maxvalue 99 cycle;

-- 뷰(view) : 가상 테이블
--            하나 이상의 테이블을 조회하는 select 문을 저장한 객체
--            편리성 - select 문의 복잡도를 완화
--            보안성 - 테이블의 특정 열을 노출하고 싶지 않은 경우

-- 생성
create view vm_emp20 as (select empno,ename,job,deptno from emp where deptno=20); 

select * from vm_emp20;

--insert
insert into vm_emp20(empno,ename,job,deptno)
values(8000, 'TEST','MANAGER',20);
select * from vm_emp20;

--view 와 원본테이블 연결 여부
select * from emp;

-- 생성된 view들의 속성 확인하기
select * 
from USER_UPDATABLE_COLUMNS
where TABLE_NAME='VM_EMP20';

-- 뷰 생성시 원본 데이터 수정 불가하도록 작성
-- with read only : 뷰를 열람만 하겠다 (원본을 수정하지 않음)
create view vm_emp_read as select empno, ename, job from emp with read only;

-- 생성된 view들의 속성 확인하기
select * 
from USER_UPDATABLE_COLUMNS
where TABLE_NAME='VM_EMP_READ';

--insert 오류남 cannot perform a DML operation on a read-only view
insert into vm_emp_read(empno,ename,job)
values(8001, 'TEST','MANAGER');

-- 뷰 삭제
drop view vm_emp20;
drop vm_emp_read;

-- 인덱스 : 빠른 검색
-- 인덱스 사용 여부에 따라 Table Full Scan, Index Scan

-- scott 가 가지고 있는 인덱스 확인하기
select * from user_indexes; --pk 설정된 값들은 인덱스로 사용됨

-- 인덱스 생성
-- create index 인덱스명 on 테이블명(열이름1 asc,열이름2 desc,열이름3...)
create index idx_emp_sal on emp(sal);

-- index가 설정된 컬럼 조회
select * from user_ind_columns;

select * from emp;

select * from emp where deptno=20;

-- index 삭제
drop index idx_emp_sal;


