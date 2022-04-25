<?php
/* ini_set('xdebug.var_display_max_depth', -1); */
/* ini_set('xdebug.var_display_max_children', -1); */
/* ini_set('xdebug.var_display_max_data', -1); */

define('URL', 'http://ark-market-poo');
define('SERVER_ROOT', $_SERVER['DOCUMENT_ROOT']);	
define('SITE_ROOT', '/ark-market-poo/');

session_start();

require_once("controller/function.php");
require_once("autoload.php");
autoload();



/* **************************** */
/* ---------- HEADER ---------- */
/* **************************** */

require_once('controller/common.php');

if(isset($_POST['choose_server']) && isset($_POST['name']))
    chooseServer($_POST['name']);
elseif(isset($_GET['quitServer']))
    quitServer();

if(isset($_SESSION['server']['name']))
    $contentHeader = serverSelected();
else
    $contentHeader = serverNoSelected();



if(isset($_GET['part'])){

    if($_GET['part'] == 'market'){

        require_once('controller/market.php');
        require_once('view/menu/marketMenuView.php');

        // Creation / Connection / Disconnection account
        if(isset($_GET['account'])){

            if($_GET['account'] == 'creation')
                accountCreation();
            elseif($_GET['account'] == 'connection')
                accountConnection();
            elseif($_GET['account'] == 'disconnection')
                accountDisconnection();

        }elseif(isset($_GET['offer'])){

            if($_GET['offer'] == 'creature'){
                creatureOfferListByType();
            }elseif($_GET['offer'] == 'saddle'){
                saddleOfferListByType();
            }elseif($_GET['offer'] == 'weapon'){
                weaponOfferListByType();
            }elseif($_GET['offer'] == 'armor'){
                armorOfferListByType();
            }
        }else
            allCategoryLastOffers();


    }elseif($_GET['part'] == 'stand'){

        require_once('controller/stand.php');
        require_once('view/menu/standMenuView.php');

        if(!userIsConnect())
            header('Location: '.URL.'/index.php?part=market');

        if(isset($_GET['section'])){
            
            if($_GET['section'] == 'dashboard'){
                /* dashboard(); */
            }elseif($_GET['section'] == 'stock'){
                stock();
            }elseif($_GET['section'] == 'desk'){
                desk();
            }
        }
        require_once('view/template.php');
    }
    else
        header('Location: '.URL.'/index.php?part=market');
}else
    header('Location: '.URL.'/index.php?part=market');
