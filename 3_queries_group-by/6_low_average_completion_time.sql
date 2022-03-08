SELECT students.name AS student, avg(assignment_submissions.duration) AS avg_asgn_durattion, avg(assignments.duration) AS avg_est_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignments ON assignments.id = assignment_id
WHERE end_date IS NULL
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY avg_asgn_durattion;