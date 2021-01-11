<?php
        require_once 'head.php';
        require_once 'nav.php';

        $array_beats = 0;

        if(isset($_POST['id_beat'])){
            $_SESSION['products'][] = $_POST['id_beat'];
        }

        if(isset($_GET['remove'])){
            $_SESSION['remove'][] = $_GET['remove'];
            
                for($i=0; $i<count($_SESSION['remove']); $i++){
                    //erase product
                    if (isset($_SESSION['products']) && ($key = array_search($_SESSION['remove'][$i], $_SESSION['products'])) !== false) {
                        unset($_SESSION['products'][$key]);
                        $array_beats = array_unique($_SESSION['products']); 
                        if(empty($array_beats)){
                            unset($_SESSION['products']);
                            // unset($_SESSION['remove']);
                        }
                    }
                }
        }   
        if(isset($_SESSION['products'])){
            $array_beats = array_unique($_SESSION['products']);
        }        
?>

<div class="container" id="cart-background">
    <div id="cart-msg">
        <?php if(isset($_SESSION['products'])) { ?>
            <h3 class="text-center mt-5 p-5">Great! Your beat has been added to the cart. Would you like to<a href="index.php#beatpod-player" class="text-decoration-none text-secondary"> keep buying</a>?</h3>
        <?php } else { ?>
            <h3 class="text-center mt-5 p-5">Your cart is empty. Go back <a href="index.php#beatpod-player" class="text-decoration-none text-secondary"> home</a></h3>
        <?php } ?>
    </div>


    <div class="d-flex justify-content-center p-md-5" id="cart-background">
        <div class="table-responsive border border-dark mb-5" id="cart">
        <table class="table">
            <thead>
                <h4 class="text-center">YOUR CART</h4>
                <tr>
                    <th class="cart-text">Beat Name</th>
                    <th class="cart-text">Tempo (BPM)</th>
                    <th class="cart-text">Genre</th>
                    <th class="cart-text">Price</th>
                    <th></th>
                </tr>

                    <?php
                        require_once 'database.php';
                        $sql = "SELECT b.name, b.id, b.route, b.tempo, g.genre_name FROM beats b LEFT JOIN genre g ON g.id = b.id_genre ORDER BY b.id DESC;";
                        $beats = mysqli_query($db, $sql);
                        $price = 25;
                        $total_price = 0;
                        if(isset($_GET['remove'])){
                            $remove = $_GET['remove'];
                        }
                        foreach($beats as $beat){
                            // var_dump($array_beats);
                            if(!empty($array_beats)){
                                foreach($array_beats as $index){
                                
                                    if($index == $beat['id']){
                                            echo '<tr>
                                                    <td>'.$beat['name'].'</td>
                                                    <td>'.$beat['tempo'].'</td>
                                                    <td>'.$beat['genre_name'].'</td>
                                                    <td>'.$price.'$</td>
                                                    <td><a class="" href="cart.php?remove='.$beat['id'].'"><i class="far fa-window-close text-danger"></i></a></td>
                                                    </tr>';
                                            $total_price += $price;
                                    }
                                }        
                            }
                            
                        }
                                        echo '<tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>Total price: '.$total_price.'$</td>
                                            </tr>';
                    ?>
    
            </thead>
        </table>
        <?php if(!empty($array_beats)) { ?>

            <form action="download-view.php" method="POST" class="d-flex justify-content-end p-5">
                <?php 
                
                if(!empty($array_beats)){
                    foreach($array_beats as $index){
                        echo '<input type="hidden" name="'.$index.'" value="'.$index.'"></input>';
                    }
                }
                ?>
                <input type="submit" class="btn btn-success w-50" value="Payment"></input></form>

        <?php } ?>
        </div>
    </div>
</div>
<?php
unset($_GET['remove']);
require_once 'footer.php';
?>
