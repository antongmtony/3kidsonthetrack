<?php
require_once 'database.php';
sleep(1);
if (isset($_POST)) {
    $email = (string)$_POST['email'];

    $res = $db->query(
        'SELECT * FROM users WHERE email = "' . strtolower($email) . '";'
    );


    if ($email == "") {
        echo "You must enter an Email Address";
    } else {
        if ($res->num_rows > 0) {
            echo "<div class='alert alert-danger'>Email adress already exists!</div>";
        } else {
            echo "<div class='alert alert-success'>Email is not taken! <i class='icon-ok'></i></div>";
        }
    }
}
