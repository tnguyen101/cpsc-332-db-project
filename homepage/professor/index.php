<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include_once '../includes/db_connect.php';
$conn = connectToDB();
$error = '';
$results = [];

if (isset($_POST['get_classes']) && !empty($_POST['ssn'])) {
    $ssn = $_POST['ssn'];
    
    $query = "SELECT c.Title, s.Classroom, s.Meeting_Days, s.Begin_Time, s.End_Time 
              FROM Section s
              JOIN Course c ON s.Course_ID = c.Course_ID
              WHERE s.Professor_SSN = ?";
    
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $ssn);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $results['classes'][] = $row;
        }
    } else {
        $error = "No classes found for this professor.";
    }
}

if (isset($_POST['get_grades']) && !empty($_POST['course_id']) && isset($_POST['section_number'])) {
    $course_id = $_POST['course_id'];
    $section_number = $_POST['section_number'];
    
    $query = "SELECT Grade, COUNT(*) as Count 
              FROM Enrollment 
              WHERE Course_ID = ? AND Section_Number = ?
              GROUP BY Grade
              ORDER BY Grade";
    
    $stmt = $conn->prepare($query);
    $stmt->bind_param("si", $course_id, $section_number);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $results['grades'][] = $row;
        }
    } else {
        $error = "No grades found for this course section.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Professor Interface</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div class="container">
        <h1>Professor Interface</h1>
        
        <div class="query-section">
            <h2>Find Your Classes</h2>
            <form method="post" action="">
                <div class="form-group">
                    <label for="ssn">Enter SSN:</label>
                    <input type="text" id="ssn" name="ssn" required>
                </div>
                <button type="submit" name="get_classes" class="btn">Get Classes</button>
            </form>
            
            <?php if (isset($results['classes'])): ?>
                <div class="results">
                    <h3>Your Classes:</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Course Title</th>
                                <th>Classroom</th>
                                <th>Meeting Days</th>
                                <th>Begin Time</th>
                                <th>End Time</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($results['classes'] as $class): ?>
                                <tr>
                                    <td><?php echo $class['Title']; ?></td>
                                    <td><?php echo $class['Classroom']; ?></td>
                                    <td><?php echo $class['Meeting_Days']; ?></td>
                                    <td><?php echo $class['Begin_Time']; ?></td>
                                    <td><?php echo $class['End_Time']; ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            <?php endif; ?>
        </div>
        
        <div class="query-section">
            <h2>Grade Distribution</h2>
            <form method="post" action="">
                <div class="form-group">
                    <label for="course_id">Course ID:</label>
                    <input type="text" id="course_id" name="course_id" required>
                </div>
                <div class="form-group">
                    <label for="section_number">Section Number:</label>
                    <input type="number" id="section_number" name="section_number" required>
                </div>
                <button type="submit" name="get_grades" class="btn">Get Grade Distribution</button>
            </form>
            
            <?php if (isset($results['grades'])): ?>
                <div class="results">
                    <h3>Grade Distribution:</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Grade</th>
                                <th>Count</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($results['grades'] as $grade): ?>
                                <tr>
                                    <td><?php echo $grade['Grade']; ?></td>
                                    <td><?php echo $grade['Count']; ?></td>
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