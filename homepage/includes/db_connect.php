<?php
function connectToDB() {
    // Local development connection
    $host = 'localhost';
    $username = 'cs332s28'; // Replace with your local MySQL username
    $password = 'p8n6OJI8'; // Replace with your local MySQL password
    $dbname = 'university_db';   // Replace with your database name
    
    // Create connection
    $conn = new mysqli($host, $username, $password, $dbname);
    
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    
    return $conn;
}
?>