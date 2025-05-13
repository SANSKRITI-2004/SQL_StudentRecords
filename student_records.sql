-- Create the Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    class VARCHAR(20)
);

-- Create the Marks table
CREATE TABLE Marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Insert sample data into Students
INSERT INTO Students (student_id, name, age, class) VALUES
(1, 'Aanya Sharma', 17, '12A'),
(2, 'Rohan Mehta', 16, '11B'),
(3, 'Sneha Kapoor', 17, '12B'),
(4, 'Arjun Rao', 15, '10A'),
(5, 'Meera Iyer', 16, '11A');

-- Insert sample data into Marks
INSERT INTO Marks (mark_id, student_id, subject, marks) VALUES
(1, 1, 'Math', 95),
(2, 1, 'Science', 88),
(3, 1, 'English', 91),

(4, 2, 'Math', 76),
(5, 2, 'Science', 83),
(6, 2, 'English', 79),

(7, 3, 'Math', 67),
(8, 3, 'Science', 73),
(9, 3, 'English', 70),

(10, 4, 'Math', 55),
(11, 4, 'Science', 60),
(12, 4, 'English', 58),

(13, 5, 'Math', 92),
(14, 5, 'Science', 89),
(15, 5, 'English', 94);

-- View student average marks and assign grade
SELECT 
    s.name,
    s.class,
    AVG(m.marks) AS average_marks,
    CASE
        WHEN AVG(m.marks) >= 90 THEN 'A+'
        WHEN AVG(m.marks) >= 75 THEN 'A'
        WHEN AVG(m.marks) >= 60 THEN 'B'
        ELSE 'C'
    END AS grade
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
GROUP BY s.name, s.class
ORDER BY average_marks DESC;
