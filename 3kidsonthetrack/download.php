<?php
if(isset($_POST)){
    require_once 'database.php';
    // var_dump($_POST);
    unset($_SESSION['products']);
    
    foreach($_POST as $result){ 
        $sql = "SELECT route, name_file FROM beats WHERE id = $result";
        $routes = mysqli_query($db, $sql);
        
        foreach($routes as $route){
            $beat_path[] = $route['route'];
            $beat_name[] = $route['name_file'];
        }
    }
    
    $timestamp = new DateTime();
    $rand = $timestamp->getTimestamp();

    $zipname = $rand.'files.zip';
    $zip = new ZipArchive;
    $zip->open($zipname, ZipArchive::CREATE);
    foreach ($beat_path as $path) {
    $zip->addFile($path);
    }
    $zip->close();
   
    header('Content-Type: application/zip');
    header('Content-disposition: attachment; filename='.$zipname);
    header('Content-Length: '.filesize($zipname));
    readfile($zipname);
}

