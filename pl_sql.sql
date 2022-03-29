--PL/SQL
--SQL 만으로는 구현이 어렵거나 구현 불가능한 작업들을 수행하기 위해서
--제공하는 프로그래밍 언어

--키워드 
--DECLAIR(선언부) : 변수,상수,커서 등을 선언(선택)
--BEGIN(실행부) : 조건문, 반복문, SELECT, DML(Update,Delete,Insert), 함수 등을 정의(필수)
--EXCEPTION(예외처리부) : 오류(예외상황) 해결(선택)

-- 실행 결과를 화면에 출력(스크립트 출력)
SET SERVEROUTPUT on;
-- Hello 출력
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello! PL/SQL');
END;
/

DECLARE
    -- 변수 선언
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME :='SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

DECLARE
    -- 상수 선언
    V_TAX CONSTANT NUMBER(1) := 3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;
/

-- 변수의 기본값 지정
DECLARE
    V_DEPTNO NUMBER(2) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- NOT NULL 지정
DECLARE
    V_DEPTNO NUMBER(2) NOT NULL := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- IF 조건문
-- IF ~THEN
-- IF ~THEN ~ ELSE
-- IF ~THEN ~ ELSIF

-- V_NUMBER 변수 선언하고 13값을 할당한 뒤 해당변수가 홀,짝 출력
DECLARE
    V_NUMBER NUMBER :=13;
BEGIN
    IF MOD(V_NUMBER,2) =1 THEN
        dbms_output.put_line('홀수'); 
    END IF;
END;
/

DECLARE
    V_NUMBER NUMBER :=14;
BEGIN
    IF MOD(V_NUMBER,2) =1 THEN
        dbms_output.put_line('홀수'); 
    ELSE
        dbms_output.put_line('짝수'); 
    END IF;
END;
/

DECLARE
    V_NUMBER NUMBER :=87;
BEGIN
    IF V_NUMBER >= 90 then
        dbms_output.put_line('A 학점'); 
    ELSIF V_NUMBER >= 80 then
        dbms_output.put_line('B 학점'); 
    ELSIF V_NUMBER >= 70 then
        dbms_output.put_line('C 학점'); 
    ELSIF V_NUMBER >= 60 then
        dbms_output.put_line('D 학점'); 
    END IF;
END;
/

-- CASE ~WITH
DECLARE
    V_SCORE NUMBER:=77;
BEGIN
    CASE TRUNC(V_SCORE/10)
    WHEN 10 THEN dbms_output.put_line('A 학점');
     WHEN 9 THEN dbms_output.put_line('B 학점');
     WHEN 8 THEN dbms_output.put_line('C 학점');
     WHEN 7 THEN dbms_output.put_line('D 학점');  
    ELSE
        dbms_output.put_line('F 학점');  
    END CASE;
    END;
    /
    
-- 반복문
-- LOOD ~ END LOOP
-- WHILE LOOP ~ END LOOP
-- FOR LOOP
-- CURSER FOR LOOP

DECLARE
    V_DEPTNO NUMBER := 0;
BEGIN
    LOOP 
        DBMS_OUTPUT.PUT_LINE('현재 V_DEPTNO : ' || V_DEPTNO);
        V_DEPTNO :=V_DEPTNO +1;
        EXIT WHEN V_DEPTNO >4;
    END LOOP;
END;
/

DECLARE
    V_DEPTNO NUMBER := 0;
BEGIN
    WHILE V_DEPTNO <4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_DEPTNO : ' || V_DEPTNO);
        V_DEPTNO :=V_DEPTNO +1;
    END LOOP;
END;
/

--시작값..종료값 : 반복문을 통해서 시작값 ~ 종료값을 사용
BEGIN
    for i in 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 i : ' || i);
    END LOOP;
END;
/

BEGIN
    for i in reverse 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 i : ' || i);
    END LOOP;
END;
/


--숫자 1~10까지 출력(홀수만)

BEGIN
    for i in 0..10 loop
        if MOD(i,2) = 1 then
        DBMS_OUTPUT.PUT_LINE('i : ' || i);
        END IF;
end loop;
end;
/
    
-- 변수 타입 선언시 특정 테이블의 컬럼 값 참조

DECLARE
    V_DEPTNO dept.deptno%TYPE := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/
    
-- 변수 타입 선언시 특정 테이블의 하나의 컬럼이 아닌 행 구조 전체 참조

DECLARE
    V_DEPT_ROW dept%rowtype;
BEGIN
    select deptno, dname, loc into v_dept_row
    from dept
    where deptno=40;
    DBMS_OUTPUT.PUT_LINE('deptno : ' || V_DEPT_ROW.deptno);
    DBMS_OUTPUT.PUT_LINE('dname : ' || V_DEPT_ROW.dname);
    DBMS_OUTPUT.PUT_LINE('loc : ' || V_DEPT_ROW.loc);
END;
/    

-- 커서(CURSOR)
-- SELECT, DELETE, UPDATE, INSERT SQL 문 실행시 해당 SQL 문을 처리하는 정보를
-- 저장한 메모리 공간

-- SELECT INTO 방식 : 결과값이 하나일 때 사용가능
-- 결과값이 몇개인지 알 수 없을 경우 CURSOR 사용

-- 1) 명시적 커서
-- declare : 커서 선언
-- opne : 커서 열기
-- fetch : 커서에서 읽어온 데이터 사용
-- close : 커서 닫기
    
DECLARE
    -- 커서 데이터를 입력할 변수 선언
    V_DEPT_ROW DEPT%rowtype;
    -- 명시적 커서 선언
    cursor c1 is
        select deptno,dname,loc
        from dept
        where deptno=40;
begin
    -- 커서 열기
    open c1;
    -- 읽어온 데이터 사용
    fetch c1 into v_dept_row;
    
    DBMS_OUTPUT.PUT_LINE('deptno : ' || V_DEPT_ROW.deptno);
    DBMS_OUTPUT.PUT_LINE('dname : ' || V_DEPT_ROW.dname);
    DBMS_OUTPUT.PUT_LINE('loc : ' || V_DEPT_ROW.loc);
    
    -- 커서 닫기
    close c1;
end;
/
    
-- 여러 행이 조회되는 경우

declare
    -- 커서 데이터를 입력할 변수 선언
    v_dept_row dept%rowtype;
    -- 명시적 커서 선언
    cursor c1 is
        select deptno,dname,loc
        from dept;
begin
    -- 커서 열기
    open c1;
    
    loop
        -- 읽어온 데이터 사용
        fetch c1 into v_dept_row;
        -- 커서에서 더이상 읽어올 행이 없을 때 까지
        exit when c1%notfound;
        
        DBMS_OUTPUT.PUT_LINE('deptno : ' || V_DEPT_ROW.deptno);
        DBMS_OUTPUT.PUT_LINE('dname : ' || V_DEPT_ROW.dname);
        DBMS_OUTPUT.PUT_LINE('loc : ' || V_DEPT_ROW.loc);
    end loop;
    
    -- 커서 닫기
    close c1;
end;
/
    
-- Cursor for ~ loop

declare
    -- 명시적 커서 선언
    cursor c1 is
        select deptno,dname,loc
        from dept;
begin
    -- 자동 open , fetch, close 
    for c1_rec IN c1 loop
        DBMS_OUTPUT.PUT_LINE('deptno : ' || c1_rec.deptno
        || ' dname : ' || c1_rec.dname
        || ' loc : ' || c1_rec.loc);
    end loop;
end;
/ 


declare
    -- 사용자가 입력한 부서 번호를 저장하는 변수 선언
    v_deptno DEPT.DEPTNO%TYPE;
    
    --명시적 커서 선언
    cursor c1 (p_deptno DEPT.DEPTNO%TYPE) is
        select deptno,dname,loc
        from dept
        where deptno = p_deptno;
begin
    -- input_deptno에 부서번호 입력받고 v_deptno에 대입
    v_deptno := &input_deptno;
    -- 자동 open , fetch, close 
    for c1_rec IN c1(v_deptno) loop
        DBMS_OUTPUT.PUT_LINE('deptno : ' || c1_rec.deptno
        || ' dname : ' || c1_rec.dname
        || ' loc : ' || c1_rec.loc);
    end loop;
end;
/ 

-- 묵시적 커서 : 커서 선은 없이 사용
-- select ~into / DML(update/delete/insert)
-- sql%rowcount : 묵시적 커서 안에 추출된 행이 있으면 행의 수 출력
-- sql%found : 묵시적 커서 안에 추출된 행이 있으면 true, 없으면 false
-- sql%isopen : 자동으로 sql문을 실행한 후 close 되기 때문에 항상 false
-- sql%notfound : 커서 안에 추출된 행이 있으면 true, 없으면 false

begin
    update dept_temp set dname = 'DATABASE' where deptno = 60;
    
    DBMS_OUTPUT.PUT_LINE('갱신된 행의 수 : ' || SQL%ROWCOUNT);
    
    if sql%found then
        dbms_output.put_line('갱신 대상 행 존재 여부 : true');
    else
        dbms_output.put_line('갱신 대상 행 존재 여부 : false');
    end if;
    
    if sql%isopen then
        dbms_output.put_line('커서의 open 여부 : true');
    else
        dbms_output.put_line('커서의 open 여부 : false');
    end if;
end;
/

commit;

-- 저장 서브 프로그램 (이름지정, 저장, 저장할 때 한 번 컴파일, 공유해서 사용 가능
-- 다른 으용프로그램에서 호출 가능)
-- 1. 저장 프로시저 : sql 문에서는 사용 불가
-- 2. 저장 함수 : sql 문에서 사용 가능
-- 3. 트리거 : 특정 상황이 발생할 때 자동으로 연달아 수행할 기능을 구현
-- 4. 패키지  : 저장서브 프로그램을 그룹화 할때 사용

CREATE PROCEDURE pro_noparam IS
    v_empno NUMBER(4) := 7788;
    v_ename VARCHAR2(10);
BEGIN
    v_ename := 'scott';
    dbms_output.put_line('v_empno : ' || v_empno);
    dbms_output.put_line('v_ename : ' || v_ename);
END;
/ -- 여기까지 프로시저를 하나 저장. 실행은 안돼고 컴파일 시킴

execute pro_noparam; -- 저장된 프로시저를 불러와서 실행


-- 다른 PL/SQL 블록에서 프로시저 실행 가능
BEGIN
    pro_noparam;
END;
/

--프로시저 작성 시 파라미터가 존재하는 경우
-- in(기본 키워드이기 때문에 생략가능)
CREATE OR REPLACE PROCEDURE pro_param_in (
    param1 IN NUMBER,
    param2 NUMBER,
    param3 NUMBER := 3,
    param4 NUMBER DEFAULT 4
) -- 인자 선언하는 개념과 같게 보면 됨
 IS
BEGIN
    dbms_output.put_line('param1 : ' || param1);
    dbms_output.put_line('param2 : ' || param2);
    dbms_output.put_line('param3 : ' || param3);
    dbms_output.put_line('param4 : ' || param4);
END;
/

execute pro_param_in(1,2);

execute pro_param_in(5,6,7,8);


execute pro_param_in(1); -- 메소드 호출 시, 갯수 동일하게 안준 것과 동일한 에러 발생 PLS-00306: wrong number or types of arguments in call to 'PRO_PARAM_IN'


-- OUT 모드
CREATE OR REPLACE PROCEDURE pro_param_out (
    in_empno  IN emp.empno%TYPE,
    out_ename OUT emp.ename%TYPE, -- 여기서 OUT은 return의(내보내는) 개념
    out_sal   OUT emp.sal%TYPE
) IS
BEGIN
    SELECT
        ename,
        sal
    INTO
        out_ename,
        out_sal
    FROM
        emp
    WHERE
        empno = in_empno;

END;
/

DECLARE
    v_ename emp.ename%TYPE;
    v_sal   emp.sal%TYPE;
BEGIN
    pro_param_out(7369, v_ename, v_sal);
    dbms_output.put_line('ename : ' || v_ename);
    dbms_output.put_line('sal : ' || v_sal);
END;
/


-- in out 모드
CREATE OR REPLACE PROCEDURE pro_param_in_out (
    in_out_no IN OUT NUMBER
) IS
BEGIN
    in_out_no := in_out_no * 2;
END;
/

DECLARE
    no NUMBER;
BEGIN
    no := 5;
    pro_param_in_out(no);
    dbms_output.put_line('no : ' || no);
END;
/


-- 트리거
-- DML 트리거
-- create or replace trigger 트리거 이름
-- 발생시기 : before | after
-- DML개념 : insert | update | delete on
-- begin 
-- end

CREATE TABLE emp_trg
    AS
        SELECT
            *
        FROM
            emp;

-- emp_trg 에 insert작업 (주말에 사원정보 추가 시, 에러 발생), update, delete도 안되도록 설정

CREATE OR REPLACE TRIGGER emp_trg_weekend BEFORE
    INSERT OR UPDATE OR DELETE ON emp_trg
BEGIN
    IF to_char(sysdate, 'DY') IN ( '토', '일' ) THEN
        IF inserting THEN
            raise_application_error(-30000, '주말 사원정보 추가 불가');
        ELSIF updating THEN
            raise_application_error(-30001, '주말 사원정보 수정 불가');
        ELSIF deleting THEN
            raise_application_error(-30002, '주말 사원정보 삭제 불가');
        ELSE
            raise_application_error(-30003, '주말 사원정보 변경 불가');
        END IF;
--오류 보고 - == > 주말에 위 작업들(update, delete, insert)을 하게 되면 이러한 에러 메세지 발생
--ORA-21000: error number argument to raise_application_error of -30001 is out of range
--ORA-06512: at "SCOTT.EMP_TRG_WEEKEND", line 6
--ORA-04088: error during execution of trigger 'SCOTT.EMP_TRG_WEEKEND'
    END IF;
END;
/

UPDATE emp_trg
SET
    sal = 3500
WHERE
    empno = 7369;

DELETE FROM emp_trg
WHERE
    empno = 7369;
    
    
-- 트리거 발생 저장 테이블 생성
CREATE TABLE emp_trg_log (
    tablename   VARCHAR(20), -- dml이 수행된 테이블 이름
    dml_type    VARCHAR(10),  -- dml 명령어 종류
    empno       NUMBER(4),   -- dml 대상이 된 사원번호
    user_name   VARCHAR(30), -- dml을 수행한 user 명
    change_date DATE         -- dml 시도 날짜
);

CREATE OR REPLACE TRIGGER emp_trg_weekend_log AFTER
    INSERT OR UPDATE OR DELETE ON emp_trg
    FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO emp_trg_log VALUES (
            'emp_trg',
            'insert',
            :new.empno,
            sys_context('USERENV', 'SESSION_USER'),
            sysdate
        );

    ELSIF updating THEN
        INSERT INTO emp_trg_log VALUES (
            'emp_trg',
            'update',
            :old.empno,
            sys_context('USERENV', 'SESSION_USER'),
            sysdate
        );

    ELSIF deleting THEN
        INSERT INTO emp_trg_log VALUES (
            'emp_trg',
            'delete',
            :old.empno,
            sys_context('USERENV', 'SESSION_USER'),
            sysdate
        );

    END IF;
END;
/

INSERT INTO emp_trg VALUES (
    9999,
    'test_tmp',
    'clerk',
    7788,
    '2018-03-03',
    1200,
    NULL,
    20
);


-- 
DROP TRIGGER emp_trg_weekend_log;