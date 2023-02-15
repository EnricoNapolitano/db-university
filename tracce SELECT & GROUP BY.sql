-- ---------------------------------------  QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT `name`, `surname`, `date_of_birth`
FROM `students`
WHERE `date_of_birth` LIKE '1990-%';


-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT `name`, `cfu`
FROM `courses`
WHERE `cfu` > 10;


-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `name`, `surname`, `date_of_birth`
FROM `students`
WHERE YEAR(`date_of_birth`) < (YEAR(CURDATE()) - 30);


-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT `name`, `period`, `year`
FROM `courses`
WHERE `period` = 'I semestre'
AND `year` = 1;


-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT * 
FROM `exams`
WHERE `date` = '2020-06-20'
AND HOUR(`hour`) >= 14;


-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT `name`, `level`
FROM `degrees`
WHERE `level` = 'magistrale';


-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(*) AS 'number of departments'
FROM `departments`;


-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT `name`, `surname`, `phone`
FROM `teachers`
WHERE `phone` IS NULL;



-- ------------------------------------------ QUERY CON GROUP BY


-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS 'enrolleds', YEAR(`enrolment_date`) AS 'enrolment date'
FROM `students`
GROUP BY YEAR(`enrolment_date`);


-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*) AS 'number of teachers', `office_address` as 'building address'
FROM `teachers`
GROUP BY `office_address`;


-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT ROUND(AVG(`vote`)) AS 'avarege vote', `exam_id` AS "exam's appeal"
FROM `exam_student`
GROUP BY `exam_id`;


-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(`name`) AS 'number of faculties', `department_id` AS 'department id'
FROM `degrees`
GROUP BY `department_id`;