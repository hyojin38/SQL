-- 문제 끝까지 읽기 . 결과는 이름 순으로 출력하세요 
SELECT name, count (name)
from ANIMAL_INS 
 group by name
 having count(name)>1
 order by name;