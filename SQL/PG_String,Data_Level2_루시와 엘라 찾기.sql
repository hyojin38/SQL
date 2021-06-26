-- 1차 
SELECT ANIMAL_ID ,NAME,SEX_UPON_INTAKE
FROM ANIMAL_INS 
WHERE (NAME LIKE 'Lucy')
    OR (NAME LIKE 'Ella') 
    OR (NAME LIKE 'Pickle') 
    OR (NAME LIKE 'Rogan') 
    OR (NAME LIKE 'Sabrina') 
    OR (NAME LIKE 'Mitty') ;
    
-- 2차 in 연산자 사용

SELECT ANIMAL_ID ,NAME,SEX_UPON_INTAKE
FROM ANIMAL_INS 
WHERE NAME in ('Lucy', 'Ella','Pickle', 'Rogan', 'Sabrina', 'Mitty') ;