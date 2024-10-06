-- Write an SQL query to identify the names of students who scored the highest mark in comparison to their peers in every subject they attended.

-- Table Schema:

-- students:
-- student_id (integer) - Unique identifier for each student.
-- student_name (varchar) - Name of the student.
-- details (varchar) - Additional details related to the student (for this challenge, it may have a static value like 'X').

-- subjects:
-- subject_id  (varchar) - Unique identifier for each subject (e.g., 'M' for Math).
-- subject_name (varchar) - Name of the subject (e.g., 'Math', 'English').

-- marks:
-- student_id (integer) - Identifier linking to the students table.
-- subject_id (varchar) - Identifier linking to the subjects table.
-- mark_rate (integer) - The mark or score the student has received for the subject.

-- Resultant Dataset Columns:
-- student_id - Unique identifier for the student.
-- student_name - The name of the student.

-- The result should be ordered by student_id in descending order.

-- EXAMPLE:
-- student_id	student_name
-- 3	        Alice Johnson
-- 1	        John Doe

WITH best_score AS (
  SELECT subject_id, MAX(mark_rate) FROM marks GROUP BY subject_id
)
SELECT
  student_id,
  student_name
FROM students
INNER JOIN marks USING (student_id)
INNER JOIN best_score USING (subject_id)
GROUP BY student_id, student_name
HAVING BOOL_AND(mark_rate = max)
ORDER BY student_id DESC