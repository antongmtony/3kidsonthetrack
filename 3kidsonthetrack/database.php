<?php
//Connection
$server = 'localhost';
$user = 'root';
$password = '';
$db_name = '3kids';
$db = mysqli_connect($server, $user, $password, $db_name);

mysqli_query ($db, "SET NAMES 'utf8'");

//Session start
if(!isset($_SESSION)){
    session_start();
}