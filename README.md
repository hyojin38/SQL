# SQL(Structured Query Language)

관계명 데이터베이스를 제어하기 위한 언어

# SQL문과 그 종류

SQL문은 RDBMS에 부여한 명령 종류에 따라 다음 3 가지로 나뉜다.

## 1.DDL(Data Definition Language)

DDL(데이터 정의 언어)는 데이터를 저장하는 DB 및 Table을 생성, 삭제하기 위한 것이다.

`CREATE`: DB or Table 등을 작성한다.
`DROP`: DB or Table 등을 삭제한다.
`ALTER`: DB or Table 등의 구성을 변경한다.

## 2.DML(Data Manipulation Language)

DML(데이터 조작 언어)은 Table의 행을 검색하거나 변경하기 위한 것이다.

`SELECT`: Table 행을 검색한다.
`INSERT`: Table에 신규 행을 등록한다.
`DELETE`: Table에서 행을 삭제한다.

## 3.DCL(Data Control Language)

DCL(데이터 제어 언어)는 DB에서 처리한 변경 내용을 확정하거나 취소하기 위한 것이다. 또한 RDBMS 사용자에게 처리 권한을 부여하기도 한다.

`COMMIT`: DB 변경 내용을 확정한다.
`ROLLBACK`: DB 변경 내용을 취소한다.
`GRANT`: 사용자에게 처리 권한을 부여한다.
`REVOKE`: 사용자에게 처리 권한을 제거한다.

## 데이터베이스 생성

```
CREATE DATABASE <이름>
```

## 테이블 작성

```
CREATE TABLE <이름>  
(   
  <열 이름1> <데이터타입> <이 열의 제약>,  
  <열 이름2> <데이터타입> <이 열의 제약>,  
  <열 이름3> <데이터타입> <이 열의 제약>,  
   ...  
  <이 table의 제약1>, <이 table의 제약2>, ...  
);
CREATE TABLE Product 
(
  id            CHAR(4)      NOT NULL,
  name          VARCHAR(100) NOT NULL,
  classify      VARCHAR(32)  NOT NULL,
  price         INTEGER,
  register_date DATE,
  PRIMARY KEY(id)
);
```

## 데이터형 지정

### INTEGER

정수를 넣기 위한 데이터형 이다. 소수는 넣을 수 없다.

### CHAR

문자열을 넣기 위한 데이터형이다. CHAR(10), CHAR(150) 처럼 열 안에 넣을 수 있는 문자열의 최대 길이를 괄호 안에 지정할 수 있다. CHAR형 옆에는 **고정 문자열**이라는 데이터가 저장된다. 고정 문자열에서는 열에 넣는 문자열 길이가 최대 길이보다 작은 경우, 문자 수가 최대 길이가 될 때 까지 공백으로 채운다.

### VARCHAR

CHAR형과 비슷하지만 **가변문자열** 형식으로 열 안에 저장된다는 곳이 다르다. 가변 문자역에서는 문자 수가 최대 길이보다 작아도 공백으로 채우지 않는다.

### 제약 설정

데이터형 외에도 열에 넣을 데이터에 제약이나 조건을 추가하는 기능이다. NULL 제약은 '데이터 없음' 상태를 표현하는 키워드다. NOT NULL 제약은 반드시 데이터가 존재해야 한다는 것을 의미한다. PRIMARY KEY(열 이름)는 주 키 제약을 의미한다. 주 키는 하나의 행을 특정 짓을 수 있는 열을 의미한다.

### 테이블 삭제

```
DROP TABLE <table 이름>;
DROP TABLE Shop;
```

## 테이블 정의 변경

열 추가하기

```
ALTER TABLE <table 이름> ADD COLUMN <열 정의>;
ALTER TABLE Shop ADD COLUMN name_eng VARCHAR(100);
```

열 삭제하기

```
ALTER TABLE <table 이름> DROP COLUMN <열 정의>;
ALTER TABLE Shop DROP COLUMN name_eng;
```

## 테이블 명 수정

```
RENAME TABLE <table 이름> to <새로운 table 이름>;
RENAME TABLE Shp to Shop;
```

# 열 출력

`SELECT`: 테이블에서 필요한 데이터를 검색해서 추출할 때 사용한다. `SELECT`구 뒤에는 테이블에서 출력하고 싶은 열의 이름들을 기술한다. `FROM`구 뒤에는 데이터를 꺼낼 대상 테이블의 이름을 지정한다.

```sql
SELECT <열 이름>, ....
   FROM <테이블 이름>;
```

```sql
SELECT id, name, price
   FROM product;
```

## 모든 열을 출력

```SQL
SELECT *
   FROM <테이블 이름>;
SELECT *
   FROM product;
SELECT product.*
   FROM product;
```

## 열에 별칭 부여 : AS

AS 키워드는 사용해서 열에 별명을 부여할 수 있다. (select, from 절)

```sql
SELECT id   AS product_id,
       name AS product_name,
       price AS product_price
  FROM product;
```

별명에 한글을 사용하려면 큰따옴표(`""`)를 사용한다.

```sql
SELECT  id     AS "상품ID",
	    name   AS "상품명",
	    price  AS "가격"
  FROM product;
```

## 결과에서 중복 행 제거 : DISTINCT

중복을 제외한 결과를 얻고 싶을 때는 SELECT 키워드 뒤에 `DISTINCT`라는 키워드를 붙인다.

```sql
SELECT DISTINCT <열 이름> ...
   FROM <테이블 이름>;
```

## From 테이블

```sql
select *
from branch as T, branch as S
where T.assets>S.assets
	and S.branch_city='대전'
	and T.branch_city <> '대전' -- <> : not
```



##  WHERE 원하는 행 선택

선택하고 싶은 행의 조건을 WHERE에 지정

- 문자열을 나타내기 위해 ' ' 사용
- and, or, not 사용 
- **between** 키워드 , not between

```sql
 select loan_number
 from loan
 where amount not between 900 and 1000
 -- 900~1000이 아닌 것
```

- **in 연산자** : 여러값을 OR 관계로 묶어 나열하는 조건을 WHERE 절에 사용할 때 쓸 수 있는 키워드

  - ~안에 포함되어있는 DATA
  - 여러 건의 범위를 지정하는 데 사용된다 값은 , 로 구분하여 괄호 내에 묶으며, 이 값 중 하나 이상과 일치하면 조건에 맞는것으로 평가
  
  - 장점 1.  IN  연산자에 다른 SELECT 문을 넣을 수 있다. 동적인 WHERE 절을 만들때 더  크게 활용된다.
  
  - 장점 2. 목록에 넣을 값이 여러개일때, 보기 쉽다.
  
  - 장점 3. 평가 순서를 보다 쉽게 관리할 수 있고 연산자의 수도 즐어든다.
  
  - 장점 4. OR 연산자 보다 실행 속도가 빠르다
  
  ```SQL
  SELECT *
  FROM  User_Table
  WHERE user_id  IN ('user1','user3')
  ORDER BY user_num DESC; 
  
  WHERE NOT User_id IN('user2','user4')
  ```
  
  

## NULL

### IS NULL 

WHERE [attribute] IS NULL //NULL 인것 조회

### IS NOT NULL

WHERE [attribute] IS NOT NULL //NULL 이 아닌것 조회



## Aggregate Function 집약함수 

질의문 수행결과 (해당 attribute의 value)에 대하여 집계를 연산하는 함수

`집약`은 '복수의 행을 하나의 행으로 모은다'라는 의미다.

- COUNT, SUM, AVG, MAX, MIN

- 집약 함수 사용 시 중복값 제외 `DISTINCT` 키워드를 사용하여 중복을 제거할 수 있다.

```sql
-- 예금주 테이블에 있는 전체 고객의 수
SELECT COUNT(DISTINCT customer_name)
  FROM depositor; 
```

### COUNT
  테이블 행수를 계산. 

- COUNT 를 제외한 모든 aggregate operation은 NULL 값을 제외하고 계산
- 즉, COUNT는  NULL도 하나로 세어버림

```sql
SELECT COUNT(*) -- * 이것을 쓸 경우 NULL값도 포함된다.
  FROM product;
  
SELECT COUNT(price) 특정 열을 지정할 경우 NULL값이 포함되지 않는다.
  FROM product;
```

### SUM

 숫자열 데이터의 합계를 구한다.

```sql
SELECT SUM(price)
  FROM product;
```

### AVG: 숫자열 데이터의 평균을 구한다.

```sql
SELECT AVG(price)
  FROM product;
```

### MAX: 임의 열이 가진 데이터의 최대값을 구한다.

```sql
SELECT MAX(price) -- date값은 최신의 정보가 됨
  FROM product;
```

### MIN: 임의 열이 가진 데이터의 최소값을 구한다.

```sql
SELECT MIN(price)
  FROM product;
```

## GROUP BY

해당 attribute 기준으로 그룹 정리 

- group by 의 기준이 되는 attribute 는 select 절에 포함된 attribute 중 하나이어야한다

GROUP BY 구에 지정하는 열을 `집약 키` 또는 `그룹화 열`이라 한다.

```sql
-- 각 지점의 계좌 평균 잔액은?
SELECT branch_name , avg(balance)
  FROM account
 GROUP BY branch_name;
```

## HAVING 

`GROUP BY`를 통해 원 테이블을 그룹으로 나누어진 그룹별로 조건을 지정해서 결과를 제한하기 위해 사용.

- having 절은 반드시 group by 절 다음에 사용

```sql
-- 지점이 보유한 예금 계좌를 평균 잔액이 1200보다 큰 지점과 해당 지점의 평균 잔액을 출력하시오 
SELECT branch_name , avg(balance)
  FROM account
 GROUP BY branch_name
 HAVING avg(balance)>1200
```

```SQL
-- Harrison 시에 거주하는 고객 중 적어도 세 개의 예금 계좌를 보유하고 있는 각 고객의 평균 잔액을 계산하시오

```

```SQL
-- Q. 각 지점별 예금 고객의 수
SELECT branch_name, count( distinct customer_name)
-- distinct: 한 고객이 여러 계좌를 가질 수 있기 때문
FROM depositor as d ,account as a -- 카티션곱! 7*7
where d.account_number=a.account_number 
 -- 의미있는 tuple 만 뽑아내기
 -- 두 테이블이 공통적으로 가진 attribute 동일한 값 가지고 있는가
 GROUP BY branch_name
 -- 고객 수가 3개 이상인 지점
 HAVING branch_name>=3
```

### HAVING 구에 쓸 수 있는 요소

`상수`, `집약 함수`, `GROUP BY` 구에 지정한 열명(=집약키)



## Nested Sub-queries 

- 다른 쿼리문 안에 포함되어있는 sub-query (중첩 서브 쿼리)
- MAIN query 안에 포함된 sub query
  - sub-query부터 찾은 다음
  - select from where절로 표현

### 1) IN/ NOT IN (set membership)

- set membership: 집합의 멤버로 data가 포함되어있는가 아닌가
- IN : 포함이 되어있으면 YES
- NOT IN : 포함되어 있지 않으면 YES

### 2) SOME /ALL (set comparison)

- set comparison: 각 data와 어떤 집합 data 비교
- some: 조건만족하는게 하나라도 있다면
- all: 모든 원소가 속성 만족해야한다

```sql
##대구시에 위치한 어떤 지점보다 많은 자산을 가지고 있는 모든 지점의 이름을 찾으시오 : some
```

```sql
##대구 시에 위치한 모든 지점보다 많은 자산을 가지고 있는 지점을 찾으시오 : all
```







## SELECT 실행 순서

축약 실행 순서

```
FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
```

전체 실행 순서

```
FROM -> ON -> JOIN -> WHERE -> GROUP BY -> CUBE | ROLLUP -> HAVING -> SELECT -> DISTINCT -> ORDER BY -> TOP
```

## 집약 함수와 GROUP BY 구를 사용할 때 자주하는 실수

### SELECT 구에 필요 없는 열을 쓴다

집약함수를 사용하는 경우 SELECT구에 쓸 수 있는 요소는 3가지이다. `상수`, `집약 함수`, `GROUP BY 구에서 지정할 열`

```
SELECT name, price, COUNT(*) -- name 때문에 에러가 난다. GROUP BY구에 없기 때문에 SELECT 구에 쓸 수 없다.
  FROM product
GROUP BY price; 
```

### GRUP BY 구에 별명을 쓴다

```
SELECT classify AS sb, COUNT(*)
  FROM product
GROUP BY sb; -- error, SELECT 구에서 부여한 별명을 GROUP BY 구에서 사용할 수 없다. (단 PostgresSQL은 허용한다.)
```

### GRUP BY 구는 결과의 순서를 정렬한다?

`GROUP BY` 구를 사용해도 표시 순서는 소트되지 않는다.

### WHERE 구에 집약함수를 사용한다.

집약함수를 사용할 수 있는 부분은 `SELECT`구와 `HAVING` 구, `ORDER BY`구 뿐이다.



## ORDER BY 구

검색 결과를 정렬하여 출력 

기본적으로 오름차순 정렬

내림차순: desc

오름차순: asc

```SQL
SELECT *   
FROM loan
ORDER BY amount asc, name desc ; -- 두개의 기준으로 정렬
```

## LIMIT 

 위에서 몇개만 보여줄지 선택. 지정된 갯수만큼의 자료만 보여줌

```SQL
SELECT name
From product
LIMIT 3;-- 상위 1~3개 를 보여준다
```

```sql
SELECT name
From product
LIMIT 2,3; -- 시작위치. 반환 갯수
		   -- 3번째 부터 3개의 자료를 반환 
		   -- 0 부터 시작하기 때문에 2가 3번째
```



## Set Operations 집합연산

tuple 집합들 간의 연산

- union, intersect, except

- 모든 집합 연산은 기본적으로 중복 Tuple 을 제거한다

  중복된 tuple을 제거한 다음 연산을 수행

- 중복을 허용하는경우 union all, intersect all, except all 사용

- 집합 연산의 주의사항

  - 연산의 대상이 되는 tuple 의 Attribute 수 같아야한다

  - UNION 대상이 되는 tuple 의 Attribute 는 같은 데이터형

  - ORDER BY 구는 마지막에 하나만 가능

    ```sql
    (SELECT id, name   FROM product   WHERE classify = '주방용품' )
     UNION
    (SELECT id, name  FROM product2  WHERE classify = '주방용품' )
     ORDER BY id;
    ```

### 1) UNION (합집합)

```sql
-- 대출이나 예금 계좌 가지고 있는 모든 고객 이름
(SELECT customer_name  FROM depositor)
  UNION
(SELECT customer_name  FROM borrower)
```

### 2) INTERSECT (교집합)

두 레코드 집합의 공통 부분을 선택

```SQL
-- 대출, 예금 계좌 모두 가지고 있는 모든 고객 이름
(SELECT customer_name  FROM depositor)
  INTERSECT
(SELECT customer_name  FROM borrower)
```

### 3) EXCEPT (차집합)

```SQL
-- 대출계좌 없이 예금 계좌만 보유하고 있는 고객 이름
(SELECT customer_name  FROM depositor)
  EXCEPT
(SELECT customer_name  FROM borrower)
```



#####  

## DB의 데이터 수정 

### 1) INSERT

`INSERT`는 특정 튜플을 relation 에 추가 

-  기존 리스트와 추가 리스트의 수가 일치해야 한다.
- 기존 리스트 생략 가능. (단, Attirbute 읫 순서를 알 때)

```SQL
INSERT INTO <테이블 이름>(열1, 열2, 열3, ...)
	  NVALUES (값1, 값2, 값3, ...)

INSERT INTO account
		VALUES('A-9735', 'Perryridge', 1200);
INSERT INTO account (branch_name,balance,account_number)
		VALUES('Perryridge',1200,'A-9735');
		
--Q. account relation에 새로운 튜플('A-777','Perryridge')을 추가. 이 튜플의 balance는 null로 저장하시오
INSERT INTO account 
		VALUES('A-777', 'Perryridge', null);
		-- 이 경우 create table 에 무결성 조건으로 1. notnull (null 을 쓸 수 x)
		-- 2. primary key도 null을 써서는 안된다. (primary key (<attribute>))
		-- 오류가 난다
```

- 다른 테이블에서 데이터를 복사

```sql
INSERT INTO productCopy (id, name, classify, sell_price, buy_price, register_date)
	SELECT id, name, classify, sell_price, buy_price, register_date
    FROM product;
```
### 2) DELETE

`DELETE`는 테이블에서  특정 튜플, 레코드(행) [삭제할 조건] 을 찾아 삭제

- 카티션곱을 사용할 수 X
- WHERE 에는 하나의 테이블만

```SQL
DELETE (X) TUPLE을 통째로 삭제하므로
FROM  <테이블(릴레이션) 이름>
WHERE <조건Predicate>;
```
```sql
-- Q.Perryride 지점에서 개설된 모든 계좌 정보를 account relation에서 삭제
DELETE 
  FROM account
  WHERE sbranch_name = 'Perryridge';
```
```SQL
--Q.Brooklyn시에 위치한 각 지점에서 개설된 모든 계좌 정보를 삭제 하라
DELETE
  FROM account
  WHERE branch_name IN (SELECT BRANCH_NAME          //IN : ~안에 포함된 DATA 찾아서 삭제
  						FROM branch					//NOT IN:~안에 포함되지 않은 문장 삭제
  						where branch_city='Brooklyn');
```
### 3) UPDATE 

`UPDATE`는 레코드(행)을 갱신하는 구이다.

```sql
UPDATE <테이블 이름>
   SET <열 이름> = <값>    //attribute를 어떻게 update할지. 이름이 들ㅇ가
   WHERE <조건>;

-- Q. A 지점 계좌에 5% 이자를 지급
UPDATE account
   SET balance = balance * 1.05 
 WHERE branc_name = 'A';
```

- 복수 열 갱신

```sql
-- 방법 1
UPDATE product
   SET sell_price = sell_price * 20,
       buy_price = buy_price / 2
 WHERE classify = '주방용품';

-- 방법 2
UPDATE product
   SET (sell_price, buy_price) = (sell_price * 20, buy_price / 2)
 WHERE classify = '주방용품';
```

### 트랜잭션

#### 트랜잭션 ?

세트로 실행해야 할 하나 이상의 갱신(DELETE, INSERT, UPDATE) 처리 집합이다.

```
트랜잭션 개시문;
  DML 문1;
  DML 문2;
  DML 문3;
  ...
트랜잭션 종료문(COMMIT or ROLLBACK);
-- postgresSQL
BEGIN TRANSACTION
 ....
COMMIT

-- mySQL
START TRANSACTION
 ....
COMMIT
```

#### ACID 특성

### 원자성(Atomicity)

### 일관성(Consistency)

### 독립성(Isolation)

### 지속성(Durability)

## Views

- 사용자는 데이터베이스에 포함된 모든 테이블의 정보 (즉, logical level의 데이터)를 알고 있을 필요가 없다
- view란 특정 사용자에게 공개된 데이터를 의미
- 다른 데이터는 hidden
- **View의 생성**

```sql
CREATE VIEW <뷰 이름> (<뷰의 열명1>, <뷰의 열명2>, ...)
AS
<SELECT 문> -- SELECT문 열과 뷰 열의 순서가 일치해야 한다.

CREATE VIEW productSum (classify, count_product)
AS
SELECT classify, COUNT(*)
  FROM product
  GROUP BY classify;

-- 사용
SELECT classify, count_product
  FROM productSum
```

#### 뷰의 제약사항

- 뷰 정의에 ORDER BY구는 사용할 수 없습니다.

#### 뷰 삭제

```
DROP VIEW <뷰 이름>;
DROP VIEW productSum;
```

### 서브쿼리

#### 서브쿼리와 뷰

`서브쿼리`는 뷰를 기반으로 하는 기술이다. 즉, `일회용 뷰`이다. 그러면 서브쿼리와 뷰의 차이는 ? 뷰는 데이터 자체를 저장하는 것이 아니라 데이터를 추출하는 `SELECT`문을 저장하는 방법으로, 사용자 편이성을 향상시키는 도구이고, 서브쿼리는 **뷰 정의 SELECT문**을 그대로 `FROM` 구에 삽입한 것이다.

```
-- 뷰
CREATE VIEW productSum (classify, count_product)
AS
SELECT classify, COUNT(*)
  FROM product
  GROUP BY classify;


SELECT classify, count_product
  FROM productSum;

-- 서브쿼리
SELECT classify, count_product
  FROM (SELECT classify, COUNT(*) AS count_product
          FROM product
          GROUP BY classify) AS productSum;
```

#### 스칼라 서브쿼리

`스칼라 서브쿼리`는 '**반드시 1행 1열만을 반환 값으로 반환한다**'라는 제약을 가진 서브쿼리이다. 즉, 10 or '부산' 처럼 하나의 값이 나온다.

```
-- 판매단가(sell_price)가 모든 상품의 평균 판매단가보다 높은 상품을 선택
SELECT id, name, sell_price
  FROM product
  WHERE sell_price > (SELECT AVG(sell_price)
                        FROM product);
```

`스칼라 서브쿼리`는 상수 or 열명을 쓸 수 있는 곳이라면 모두 가능하다.

```
SELECT id, name, sell_price, (SELECT AVG(sell_price) FROM product) AS avg_price
  FROM product;
```

- Note: 스칼라 서브쿼리 사용시 복수 행을 반환하지 않도록 해야 한다.

#### 상관 서브쿼리

바깥 쿼리 테이블의 열이 안쪽 쿼리에 나오는 경우.

- Note: 상관 서브쿼리는 성능이 좋지 않다.

```
-- 상품 분류별(classify)별로 평균 판매단가보다 높은 상품 질의
SELECT classify, name, sell_price
  FROM product AS S1
  WHERE sell_price > (SELECT AVG(sell_price)
                        FROM product AS S2
                        WHERE S1.classify = S2.classify);
```



## JOIN

- `결합(JOIN)`은 다른 테이블에서 열을 가지고 와서 **열을 늘리는** 처리다.
- 조인이란 여러 테이이블에 흩어져 있는 정보 중 사용자가 필요한 정보만 가져와서 가상의 테이블처럼 만들어서 결과를 보여주는 것으로 2개의 테이블을 조합하여 하나의 열로 표현하는 것이다.
- 테이블 간 적어도 하나의 컬럼을 공유하고 있어야한다
- 이 공유하고 있는 컬럼을 PK또는 FK 값으로 사용한다



### 1)INNER JOIN (내부 결합) : 교집합

![INNER JOIN ](https://github.com/hyojin38/SQL/blob/main/IMG/inner_join.JPG)

- 교집합. 공통적인 부분만 select 된다
- sql 에서 단순히 조인 사용시 암묵적으로 inner join

```sql
SELECT A.ID ,A.ENAME, A.KNAME
  FROM A
  INNER JOIN B
  ON A.ID=B.ID 
  
  -- ON은 결합 조건(두개의 테이블을 연결할 열(결합키)을 설명하는 구이다.
```

- 3개의 테이블을 내부 결합

```SQL
SELECT TS.store_id, TS.store_name, TS.id, S.name, S.sell_price, ZS.stock_num
  FROM storeProduct AS TS
  INNER JOIN product AS S
  ON TS.id = S.id
  [INNER] JOIN stockProduct ZS
  ON TS.id = ZS.id
  WHERE ZS.storage_id = 'S001';
```

### 2)OUTER JOIN (외부 결합)

OUTER JOIN은 한 쪽에는 데이터가 있고 한쪽에는 데이터가 없는 경우, 데이터가 있는 쪽 테이블의 내용 전부를 출력하는 방법.

즉, 조인 조건에 만족하지 않더라도 해당 행을 출력하고 싶을때 사용한다.

#### 2-1. left outer join

- left table 은 from 절의 table //join 기준 왼쪽

- right table 은 join 절의 table // join 기준 오른쪽

  ![LEFT OUTER JOOIN](https://github.com/hyojin38/SQL/blob/main/IMG/left_outer_join.JPG)

- 매칭되는 데이터가 없는 경우 NULL표기

```sql
SELECT employee.empName, department.deptName
  From employee
LEFT OUTER JOIN department
  ON employee.deptNO=department.deptNo
```

#### 2.2. L-R

![L-R JOOIN ](https://github.com/hyojin38/SQL/blob/main/IMG/A-B.JPG)

- JOIN 기준 왼쪽에 있는 것 '만' 

- A -B = LEFT OUTER JOIN +WHERE (RIGHT KET IS NULL)
```sql
SELECT employee.empName, department.deptName
  From employee
LEFT OUTER JOIN department
  ON employee.deptNO=department.deptNo
  WHERE departmet.deptNo IS NULL
```

#### 2-3. right outer join

  ![RIGHT OUTER JOOIN ](https://github.com/hyojin38/SQL/blob/main/IMG/right_outer_join.JPG)


```sql
SELECT employee.empName, department.deptName
  From employee
RIGHT OUTER JOIN department
  ON employee.deptNO=department.deptNo
```

#### 2-4. R-L

![L-R JOOIN ](https://github.com/hyojin38/SQL/blob/main/IMG/B-A.JPG)

- JOIN 기준 오른쪽에 있는 것 '만' 

- B-A = RIGHT OUTER JOIN +WHERE (LEFT KET IS NULL)
```sql
SELECT employee.empName, department.deptName
  From employee
RIGHT OUTER JOIN department
  ON employee.deptNO=department.deptNo
  WHERE emplotee.deptNo IS NULL
```

#### 2-5. FULL OUTER JOIN

![FULL OUTER JOIN](https://github.com/hyojin38/SQL/blob/main/IMG/outer_join.JPG)

- A, B 테이블이 가지고 있는 것 다

  임효진	IT

  문정진	NULL

  NULL	경리부

  NULL	인사부

```sql
SELECT employee.empName, department.deptName
  From employee
FULL OUTER JOIN department
  ON employee.deptNO=department.deptNo
```

#### 2-5. FULL OUTER JOIN -A,B의 교집합 제외

![FULL OUTER JOIN](https://github.com/hyojin38/SQL/blob/main/IMG/FULL-AB.JPG)

- 왼쪽에 있는 것만 + 오른쪽에 있는 것 만

  문정진	NULL

  NULL	경리부

  NULL	인사부

```sql
SELECT employee.empName, department.deptName
  From employee
FULL OUTER JOIN department
  ON employee.deptNO=department.deptNo
  WHERE employee.deptNo IS NULL
  OR department.deptNo IS NULL
```

### 3)CROSS JOIN (크로스 결합) : 2*3=6

`크로스 결합`은  특정 기준없이. 두 개의 테이블에 있는 모든 레코드를 가지고 가능한 모든 조합을 만들어 내는 결합 방법이다. 

한개의 테이블이 2행, 다른 테이블이 3행이라면 6행의 결과가 나온다.

- 특정 기준이 필요 없어 ON 이 사용되지 않음

`내부 결합`은 '`크로스 결합` 결과에 포함되는 부분을 가진다'라는 의미를 내포하며, `외부 결합`은 '`크로스 결합` 결과에 포함되지 않는 부분을 가진다'라는 의미가 있다.

```SQL
SELECT employee.empName, department.deptName 
  FROM employee
  CROSS JOIN department;
  임효진	IT 
  문정진	IT
  임효진   경리부
  문정진	경리부
  임효진   인사부
  문정진	인사부
```


### 4) SELF JOIN

 자기 스스로를 결합

셀프 조인은 이너조인 및 아우터 조인, 크로스 조인과 동일 방식으로 사용될 수 있지만 join 할 때 기본 테이블 이외에 참조하는 테이블이 다른 테이블이 아닌 자기 자신이라는 점이 중요하다.

- 별칭이 필수

  | empNo | empName | job  | manager | hirdate | deptNo |
  | ----- | ------- | ---- | ------- | ------- | ------ |
  | 1001  | 임효진  | 사원 | 1013    | 2021.07 | 1      |

  테이블에서 사원 정보와 manager 사번이 있따.

  사원이름과 그 사원의 매니저의 이름을 알고 싶을 때 셀프 조인을 사용한다.

  ```sql
  SELECT A.empName 직원이름 , B,empName 매니저이름
  FROM employee A
  (  )JOIN employee B
  ON A.manager=B.empNo
  ```

  ```SQL
  SELECT A.empName 직원이름 , B,empName 매니저이름FROM employee A, employee B
  WHERE A.manager=B.empNo
  ```
  
  
  
  

## 날짜 및  시간 관련 함수 정리

### 1. DATETIME 데이터

 YYYY-MM-DD hh:mm:ss[.nnn]

#### -  YEAR(date) / MONTH(date) / DAY(date)

#### -  HOUR(time)/MINUTE(time)/SECOND(time)

#### -  DATE_FORMAT(date, 'format형태')

​	format에 활용되는 문자[ 참고 ](https://dev.mysql.com/doc/refman/5.7/en/date-and-time-functions.html#function_date-format)

​		%Y(2021) %m(08) %d(27) /%M(july),%D(1st)

​		%h %i %s : 시 , 분 , 초

```sql
SELECT ANIMAL_ID,NAME, DATE_FORMAT(DATETIME,''%Y-%m-%d')
```



#### - 이외 
 - dayofweek(date) / weekday(date)

   ​	날짜를 한 주의 몇 번째 요일인지 나타내는 숫자로 리턴

   ​	(1=일/2=월/..7=토)

 - dayofmonth(date) / dayofyear(date)

   그 달의 몇 번째 날인지를 알려준다. 리턴 값은 1에서 31 사이이다.

   그 날이 몇 번재 날인지 알려줌. 1~366

 - dayname(date) / monthname(date) 

   ​	해당 날짜의 영어식 요일/월 이름 리턴

 - period_add(p,n)

   yymm 또는 yyyymm 형식으로 주어진 달에 n개월을 더한다. 리턴 값은 yyyymm의 형식이다 

   ```sql
   elect period_add(9801,2); // 199803
```

- period_diff(p1,p2) 

  두 기간사이의 개월을 구한다

- quarter(date)

  분기를 리턴 (1~4)

- **date_add(date,interval expr type)** =**adddate(date,interval expr type)**

  **date_sub(date,interval expr type)**=**subdate(date,interval expr type)**

  sql 3.22 ver 새롭게 추가되었다.

  date 는 시작일을 나타내는 datetime 또는date 타입이다. expr 는 시작일에 가감하는 일수 또는 시간을 나타내는 표현식

  ```sql
  select date_add("1997-12-31 23:59:59",interval 1 second);
  -> 1998-01-01 00:00:00
  
  select date_add("1997-12-31 23:59:59",interval 1 day);
  -> 1998-01-01 23:59:59
  
  select date_add("1997-12-31 23:59:59",interval "1:1" minute_second);
  -> 1998-01-01 00:01:00
  
  select date_sub("1998-01-01 00:00:00",interval "1 1:1:1" day_second);
  -> 1997-12-30 22:58:59
  
  select date_add("1998-01-01 00:00:00",interval "-1 10" day_hour);
  1997-12-30 14:00:00
  
  select date_sub("1998-01-02", interval 31 day);
  -> 1997-12-02
  
```

  

## 조건문

### IF ( 조건, 참일때 결과, 거짓일 때 결과) 

제어 부분이 계속 중첩 된다면 CASE 문 사용해야한다

```SQL
SELECT if(NAME IS NULL,'No Name',NAME)
```

```sql
SELECT * 
FROM join_table
WHERE if( CHAR_LENGTH(name) = 2, 'Y', 'N' ) = 'Y';
```

### CASE WHEN THEN ELSE END 조건문

```SQL
CASE 
	WHEN 조건1 THEN '조건1 반환값'
	WHEN 조건2 THEN '조건2 반환값'
	ELSE '충족되는 조건 없을 때 반환값'
END
```

```SQL
SELECT
	age,
	CASE
		WHEN (animal_ins.age BETWEEN 1 AND 3) THEN 'A'
		WHEN (animal_ins.age BETWEEN 4 AND 6) THEN 'B'
		ELSE 'C'
	END AS age_group
FROM animal_ins
```

### IFNULL 조건문

```SQL
SELECT IFNULL(NULL이 아니면 출력, NULL이면 출력되는)
```

```sql
SELECT ANIMAL_TYPE,
  ifnull(NAME,'No name'),SEX_UPON_INTAKE
```



## STRING 문자열

### Substirng() : 문자열 일부 추출

```sql
SUBSTR(str, pos) //str에서 pos번째 위치에서 이후의 모든 문자 읽어들인다
SUBSTR(str, pos,len) //str에서 pos번째 위치에서 len까지 문자 읽어들인다

SELECT ANIMAL_ID,NAME,SUBSTR(DATETIME, 1, 10)
```

### CONCAT() :문자열 결합

```
CONCAT (문자열1, 문자열2, 문자열3, ...)
```

### TRIM()/ RTRIM() /LTRIM() : 문자열 공백 제거

​	TRIM( [ [위치:leading/trailing/both] [제거 문자열:없다면 공백 제거] FROM] 문자열 )

### REPLACE() :문자열 치환

​	**REPLACE**('문자열', '치환할 문자열', '치환될 문자열')

###  Like : String Operation 

​	찾고싶은 문자열 패턴을 지정할 때 사용

​    부분문자열의 매칭질문은 = 대신 like 사용

​	문자열패턴: %와 _기호를 사용

- %: 어떤 부분 문자열

- _: 어떤 한 문자

  ````sql
  where customer_street like '%Main%'
  
  -- Main%: Main으로 시작
  -- %Main: Main으로 끝
  -- %Main%: 문자열 어디든 Main 있는 것
  -- _%Main%_ : 중간에 Main이 있는 것
````


###  REGEXP

 LIKE 를 이용한 검색과 달리 Regular Expression(정규 표현식)을 이용해 검색한다.

 REGEXP를 사용하면 SQL에서 정규표현식을 활용하여 기본 연산자 보다 복잡한 문자열 조건을 걸어 데이터를 검색할 수 있다.

```SQL
WHERE data REGEXP 'A|B|C'
```



## 기타

### 1. WITH RECURSIVE

- 메모리 상에 가상의 테이블을 저장
- 재귀 쿼리를 이용하여 실제로 테이블을 생성하거나 데이터 삽입을 하지 않아도 가상 테이블을 생성할 수 있다

```
WITH RECURSIVE 테이블명 AS(
	(SELECT 초기값 AS 컬럼별명1)
	UNION ALL
	(SELECT 컬럼별명1 계산식 
	FROM 테이블명)
	WHERE 제어문)
```

```sql
WITH RECURSIVE TIME_T AS (
  (SELECT 0 AS H)
  UNION ALL
  (SELECT H+1 
  FROM TIME_T
  WHERE H<23)
)

SELECT TIME_T.H,COUNT(HOUR(ANIMAL_OUTS.DATETIME))
FROM TIME_T
LEFT OUTER JOIN ANIMAL_OUTS 
ON TIME_T.H=HOUR(ANIMAL_OUTS.DATETIME)
GROUP BY TIME.H_T
```

