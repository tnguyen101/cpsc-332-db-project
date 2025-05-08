<?php
function connectToDB() {
    $host = 'localhost';
    $username = 'dbuser';
    $password = 'yourpassword';
    $dbname = 'university_db';
    
    $conn = new mysqli($host, $username, $password, $dbname);
    
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    
    return $conn;
}
?>