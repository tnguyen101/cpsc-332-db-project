<?php
include_once '../includes/db_connect.php';
$conn = connectToDB();
$error = '';
$results = [];

if (isset($_POST['get_sections']) && !empty($_POST['course_id'])) {
    $course_id = $_POST['course_id'];
    
    $query = "SELECT s.Section_Number, s.Classroom, s.Meeting_Days, s.Begin_Time, s.End_Time, 
                     COUNT(e.Student_ID) as Enrolled_Students
              FROM Section s
              LEFT JOIN Enrollment e ON s.Course_ID = e.Course_ID AND s.Section_Number = e.Section_Number
              WHERE s.Course_ID = ?
              GROUP BY s.Section_Number, s.Classroom, s.Meeting_Days, s.Begin_Time, s.End_Time";
    
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $course_id);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $results['sections'][] = $row;
        }
    } else {
        $error = "No sections found for this course.";
    }
}

if (isset($_POST['get_grades']) && !empty($_POST['student_id'])) {
    $student_id = $_POST['student_id'];
    
    $query = "SELECT c.Course_ID, c.Title, e.Section_Number, e.Grade
              FROM Enrollment e
              JOIN Course c ON e.Course_ID = c.Course_ID
              WHERE e.Student_ID = ?
              ORDER BY c.Course_ID";
    
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $student_id);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $results['student_grades'][] = $row;
        }
    } else {
        $error = "No courses found for this student.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Interface</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div class="container">
        <h1>Student Interface</h1>
        
        <div class="query-section">
            <h2>Course Sections</h2>
            <form method="post" action="">
                <div class="form-group">
                    <label for="course_id">Enter Course ID:</label>
                    <input type="text" id="course_id" name="course_id" required>
                </div>
                <button type="submit" name="get_sections" class="btn">Get Sections</button>
            </form>
            
            <?php if (isset($results['sections'])): ?>
                <div class="results">
                    <h3>Course Sections:</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Section Number</th>
                                <th>Classroom</th>
                                <th>Meeting Days</th>
                                <th>Begin Time</th>
                                <th>End Time</th>
                                <th>Enrolled Students</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($results['sections'] as $section): ?>
                                <tr>
                                    <td><?php echo $section['Section_Number']; ?></td>
                                    <td><?php echo $section['Classroom']; ?></td>
                                    <td><?php echo $section['Meeting_Days']; ?></td>
                                    <td><?php echo $section['Begin_Time']; ?></td>
                                    <td><?php echo $section['End_Time']; ?></td>
                                    <td><?php echo $section['Enrolled_Students']; ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            <?php endif; ?>
        </div>
        
        <div class="query-section">
            <h2>Student Grades</h2>
            <form method="post" action="">
                <div class="form-group">
                    <label for="student_id">Enter Student ID:</label>
                    <input type="text" id="student_id" name="student_id" required>
                </div>
                <button type="submit" name="get_grades" class="btn">Get Grades</button>
            </form>
            
            <?php if (isset($results['student_grades'])): ?>
                <div class="results">
                    <h3>Student's Courses and Grades:</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Course ID</th>
                                <th>Course Title</th>
                                <th>Section</th>
                                <th>Grade</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($results['student_grades'] as $grade): ?>
                                <tr>
                                    <td><?php echo $grade['Course_ID']; ?></td>
                                    <td><?php echo $grade['Title']; ?></td>
                                    <td><?php echo $grade['Section_Number']; ?></td>
                                    <td><?php echo $grade['Grade']; ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            <?php endif; ?>
        </div>
        
        <div class="back-link">
            <a href="../index.html">Back to Home</a>
        </div>
        
        <?php if (!empty($error)): ?>
            <div class="error"><?php echo $error; ?></div>
        <?php endif; ?>
    </div>
</body>
</html>