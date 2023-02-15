-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name` AS 'Name', `students`.`surname` AS 'Surname', `degrees`.`name` AS 'Course'
FROM `students`
JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`. `name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT  `departments`.`name` AS 'Department' , `degrees`.`name`  AS 'Degree'
FROM `departments`
JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` =  "Dipartimento di Neuroscienze" 
AND `degrees` . `level` = "magistrale" ;


-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `teachers`.`name` AS `Name`, `teachers`.`surname` AS `Surname`, `courses`.`name` AS `Course`
FROM `teachers`
JOIN `course_teacher`
ON `course_teacher` . `teacher_id`= `teachers`.`id`
JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
WHERE `teachers`.`id`= 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`registration_number`, `students`.`surname` AS 'Surname', `students`.`name` AS 'Name', `degrees`.`name` AS 'Course',`degrees`.`level` AS 'Level', `departments`.`name` AS 'Department',
FROM `students`
JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`surname` ASC , `students`.`name` ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS `Degree`, `courses`.`name` AS `Course`, `teachers`.`id` AS `ID`,`teachers`.`surname` AS `Surname`, `teachers`.`name` AS `Name`
FROM `degrees`
JOIN `courses`
ON `courses`.`degree_id` = `degrees`.`id`
JOIN`course_teacher`
ON `course_teacher`.`course_id`= `courses`.`id`
JOIN `teachers`
ON `teachers`.`id`= `course_teacher`.`teacher_id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `teachers`.`name` AS 'Name', `teachers`.`surname` AS 'Surname', `departments`.`name` AS 'Department'
FROM `departments`
JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `departments`.`name` = 'Dipartimento di Matematica';