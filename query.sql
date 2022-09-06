-- ---------------------------------------  QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT `name`,`date_of_birth` FROM `students` WHERE `date_of_birth` LIKE '1990-%-%' ORDER BY `date_of_birth` ASC;

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT `cfu` FROM `courses` WHERE `cfu` > '10';

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `id`,`date_of_birth` FROM `students` WHERE `date_of_birth`< '1992-09-06' ORDER BY `date_of_birth` ASC;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT `id`,`period`,`year` FROM `courses` WHERE `period` = 'I semestre' AND `year`= '1';

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT `id`,`date`,`hour`FROM `exams` WHERE `date` = '2020-06-20' AND `hour` >='14:00:00' ORDER BY `date`, `hour` ASC;

-- 6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT `id`,`level` FROM `degrees` WHERE`level`='magistrale';
-- 7. Da quanti dipartimenti è composta l'università? (12)

SELECT COUNT( *) FROM `departments`;
-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT `id`,`phone` FROM `teachers` WHERE `phone` IS null;

-- ------------------------------------------ QUERY CON GROUP BY


-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(`id`),YEAR(`enrolment_date`) FROM `students` GROUP BY `enrolment_date`;
-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(`id`),`office_address` FROM `teachers` GROUP BY `office_address`;
-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT `exam_id`, AVG(`vote`) FROM `exam_student` GROUP BY `exam_id`;
-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(`department_id`),`name` FROM `degrees` GROUP BY `name`;