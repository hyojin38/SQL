-- if 이용 
SELECT ANIMAL_ID,NAME,
    IF( ((SEX_UPON_INTAKE LIKE '%Neutered%' ) OR (SEX_UPON_INTAKE LIKE '%Spayed%' )),
       'O','X')
FROM ANIMAL_INS 
ORDER BY ANIMAL_ID;

-- CASE WHEN THEN ELSE END, REGEXP
SELECT ANIMAL_ID,NAME,
    CASE
        WHEN ( SEX_UPON_INTAKE REGEXP 'Neutered|Spayed') THEN 'O'
        ELSE 'X'
       
    END
FROM ANIMAL_INS 
ORDER BY ANIMAL_ID;