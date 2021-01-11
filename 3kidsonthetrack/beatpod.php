<!-- THE BEAT POD -->

<div class="player-container" id="player">
        <?php
        require_once 'database.php';
        if(isset($_POST['genre_filter']) && $_POST['genre_filter'] != 0){
            $filter = $_POST['genre_filter'];
            $sql = "SELECT b.name, b.id, b.route, b.tempo, g.genre_name FROM beats b LEFT JOIN genre g ON g.id = b.id_genre WHERE g.id = '$filter' ORDER BY b.id DESC;";
        }else{
            $sql = "SELECT b.name, b.id, b.route, b.tempo, g.genre_name FROM beats b LEFT JOIN genre g ON g.id = b.id_genre ORDER BY b.id DESC;";
        }
        $beats = mysqli_query($db, $sql);

        $genre_sql = "SELECT * FROM genre;";
        $genres = mysqli_query($db, $genre_sql);



        echo
            '<div id="beatpod-player" class="player col-md-6">

            <form action="index.php#beatpod-player" class="m-3"  method="POST" id="genre_form">
                    <div class="form-group">
                        <div class="form-row d_flex justidy-content-center">
                            <label class="m-1 p-2" for="genre_filter">Genre</label>
   
                                <select name="genre_filter" id="genre_filter">';
                                    echo '<option value="0">Choose Genre</option>';
                                foreach ($genres as $genre){
                                    echo '<option value="'.$genre['id'].'">'.$genre['genre_name'].'</option>';
                                }

        echo '</select>
                    <input type="submit" class="ml-1 btn btn-dark" value="Search">
                                        
                    </div>

                </div>
                
            </form>';                            

            

            
                
        echo '                  
            
        <div class="player__controls">
    
                                
                <div class="player__btn player__btn--small">';

                if(!empty($_SESSION['user'])){
                    echo '
                    <form action="cart.php" method="POST">
                              <input type="hidden" id="id_beat" name="id_beat"></input>
                              <input class="player__buy text-secondary font-weight-bold" type="submit" value="BUY"></input>
                          </form>
                          
                        </div>
                    </div>';
                }else{

                    echo '<a href="#login-form" class="text-secondary font-weight-bold text-decoration-none" data-toggle="modal" data-target="#login-form" data-dismiss="modal" aria-label="Close">BUY</a>
                         </div>
                    </div>';
                }
                
                echo '                    
                    <div class="player__album">
                        <img src="img/logo.png" alt="" class="player__img">
                    </div>
                    <h2 class="player__artist">3 Kids on the track</h2>
                    <h3 class="player__song">LAST BEATS:</h3>

                    <div class="overflow-auto d-flex" id="playlist">
                    
                        <ul id="track_list" class="row col-12">';


        foreach ($beats as $beat) {

            echo
                '<li class="list-unstyled row col-12" id="'.$beat['id'].'">
                                        <a href="'.$beat['route'].'" id="'.$beat['id'].'" class="text-dark tracklink"><i class="far fa-play-circle play_track_btn"></i>'.' '.$beat['name'].' '.$beat['tempo'].' BPM'.' '.$beat['genre_name'].'</a>   
                                        <!--<i class="fas fa-shopping-cart"></i>-->             
                </li>
                
                ';
        }



        echo '</ul>';
            
        echo '</div>

            <audio src="" class="player__audio" data="" controls id="audioPlayer">
                
            </audio>

            
            <div class="hp_slide">
            <div class="hp_range"></div>
    </div>
            <div class="player__controls col-md-4">    

                <div class="player__btn player__btn--medium" onclick="playlist.prevTrack();">
                   <i class="fas fa-backward"></i>
                </div>
            
                <div class="player__btn player__btn--medium blue" id="play">
                    <i class="fas fa-play play-btn"></i>
                    <i class="fas fa-pause pause-btn hide"></i>
                </div>

                <div class="player__btn player__btn--medium" onclick="playlist.nextTrack();">
                   <i class="fas fa-forward"></i>
                </div>
            </div>'
        ?>
        
    </div>
    </div>