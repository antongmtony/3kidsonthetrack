<?php
    require_once 'head.php';
    require_once 'nav.php';
    require_once 'database.php';
?>

<div class="m-5 border bg-light rounded">
    <div class="container mt-5 mb-5">
        <div class="container border border-dark mt-5 p-5 rounded bg-light">
            <div class="mt-5 mb-5">
                <h1>Thank your for your purchase, <?php echo $_SESSION['user']['name'] ?>!</h1>
            </div>

            <div class="mt-5 mb-5">
                <h2>Here you can download your files:</h2>
            </div>

            <div class="p-5 mb-5 d-flex justify-content-center">
                <?php
                    if(isset($_POST)){

                        $products = $_POST;
                        $user = $_SESSION['user']['id'];

                        foreach($products as $product){
                            $sql = "INSERT INTO sales VALUES (NULL, '$user', '$product');";

                            $insert_sale = mysqli_query($db, $sql);
                        }

                        echo '<form action="download.php" method="POST">';
                        foreach($_POST as $result){
                            echo '<input type="hidden" name="'.$result.'" value="'.$result.'"></input>';
                        }
                        echo '<input type="submit" class="btn btn-secondary" value="DOWNLOAD YOUR FILES"></input>';
                        echo '</form>';
                    }
                ?>
            </div>

            <div class="mb-5">
                <a href="index.php" class="text-decoration-none text-secondary text-center mt-5 mb-5 p-5">Go to main page</a>
            </div>
        </div>
    </div>
</div>

<?php
    require 'footer.php';
?>