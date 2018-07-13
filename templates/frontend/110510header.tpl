<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />

	  <title>{$metaTitle}</title>	
  <meta name="description" content="{$metaDescription}" />
  <meta name="keywords" content="{$metaKeywords}" />
  <meta name="google-site-verification" content="KytVwp3TMxkxMavrauh5jSXdPnORAPLmnMxE373q9Fk" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1″ />
  {if $tinyMce}
  <script type="text/javascript" src="inc/tinymce/tiny_mce.js"></script>
  <script type="text/javascript" src="js/frontend-mce.js"></script>
  {/if}

	<link href="style.css" type="text/css" rel="stylesheet" />
	{if $metaCanonical!=''}
  <link rel="canonical" href="{$metaCanonical}.html" />
  {/if}

  <link href="css/jquery.selectbox.css" type="text/css" rel="stylesheet" />
    <link href="css/jquery.jcarousel.css" type="text/css" rel="stylesheet" />
      <link href="css/jquery.fancybox-1.3.1.css" type="text/css" rel="stylesheet" />

  <script src="js/jquery.js" type="text/javascript"></script>
  <script src="js/script.js" type="text/javascript"></script>
  <script src="js/jquery.selectbox-0.6.1.js" type="text/javascript"></script>
  <script src="js/jquery.fancybox-1.3.1.js" type="text/javascript"></script>
  <script src="js/jquery.mousewheel-3.0.2.pack.js" type="text/javascript"></script>
  <script src="js/jquery.easing-1.3.pack.js" type="text/javascript"></script>
  <script src="js/jquery.jcarousel.js" type="text/javascript"></script>
  <script src="js/jFav_v1.0.js" type="text/javascript"></script>
  <script type="text/javascript" src="js/jquery.jmpopups-0.5.1.js"></script>
		
</head>
<body>


<h1 class="header_h1">{$metaHeader}</h1>

<!--header starts here-->
<div id="header">
  <!--share box starts here-->
  <div class="share_box">
    <a href="http://www.facebook.com/sharer.php?u={$ezazurl}" target="_blank" title="Facebook" class="facebook"></a>
    <a href="http://twitter.com/?status=Most%20olvasom:{$ezazurl}" target="_blank" title="Megosztás Twitteren" class="csillag"></a>
    <a href="#" title="Kedvencek közé">Kedvencek közé</a>
  </div>
  <br class="clear" />
  <!--share box ends here-->
  
  
  <!--header img pager starts here-->
  <div class="headerImgPager">
    <div class="container">
      <a href="images/szauna1.jpg" title="" class="fancybox"><img src="images/szauna1Small.jpg" alt="" title="" height="128" /></a>
      <a href="images/szauna2.jpg" title="" class="fancybox"><img src="images/szauna2Small.jpg" alt="" title="" height="128" /></a>
      <a href="images/szauna3.jpg" title="" class="fancybox"><img src="images/szauna3Small.jpg" alt="" title="" height="128" /></a>
      <a href="images/szauna4.jpg" title="" class="fancybox"><img src="images/szauna4Small.jpg" alt="" title="" height="128" /></a>
      <a href="images/szauna5.jpg" title="" class="fancybox"><img src="images/szauna5Small.jpg" alt="" title="" height="128" /></a>
      <a href="images/szauna6.jpg" title="" class="fancybox"><img src="images/szauna6Small.jpg" alt="" title="" height="128" /></a>
      <a href="images/szauna7.jpg" title="" class="fancybox"><img src="images/szauna7Small.jpg" alt="" title="" height="128" /></a>
      <a href="images/szauna8.jpg" title="" class="fancybox"><img src="images/szauna8Small.jpg" alt="" title="" height="128" /></a>
      <a href="images/szauna9.jpg" title="" class="fancybox"><img src="images/szauna9Small.jpg" alt="" title="" height="128" /></a>
      <a href="images/szauna10.jpg" title="" class="fancybox"><img src="images/szauna10Small.jpg" alt="" title="" height="128" /></a>
      <a href="images/szauna11.jpg" title="" class="fancybox"><img src="images/szauna11Small.jpg" alt="" title="" height="128" /></a>
      <a href="images/szauna12.jpg" title="" class="fancybox"><img src="images/szauna12Small.jpg" alt="" title="" height="128" /></a>
      <a href="images/szauna13.jpg" title="" class="fancybox"><img src="images/szauna13Small.jpg" alt="" title="" height="128" /></a>
      <a href="images/szauna14.jpg" title="" class="fancybox"><img src="images/szauna14Small.jpg" alt="" title="" height="128" /></a>
    </div>
  </div>
  <!--header img pager ends here-->
  
  
  <!--search box starts here-->  
  <div class="search_box">
    <form action="{$searchResultsFilename}" method="post">
    <input type="hidden" name="donagykeres" id="donagykeres" value="1" />
	      <input type="hidden" name="dosearch" value="Keresés" />
      <div>
        <input type="text" name="searchpattern" id="searchpattern" />
      </div>
      <div class="submit">
        <input type="submit" value="KERESÉS" onclick="javascript: return document.getElementById('searchpattern').value!=''; " />
      </div>        
    </form>
  </div>
  <br class="clear" />
  <!--search box ends here-->    


  <div class="info">
    <h3>Abachi Szauna</h3>
    <p>Szauna építés és szauna kellékek
    <br /><br />
    
    Telefon: 06 70 33 55 049
    <br />
    E-mail: <a href="mailto: info@abachiszauna.hu" title="info@abachiszauna.hu">info@abachiszauna.hu</a>
    </p>
  </div>
</div>
<!--header ends here-->
<div id="content_wrapper">
  <!--main menu starts here-->
  <div id="main_menu">
    <ul>
      <li><a href="/" title="" class="active" id="main_menu1">Főoldal</a></li>
      <li><a href="{$searchFilename}" title="" id="main_menu2">Keresés</a></li>
      <li><a href="{$cegbemutato}" title="" id="main_menu3">Cégbemutató</a></li>
      <li><a href="{$pgDeliveryFilename}" title="" id="main_menu4">Szállítás</a></li>
      <li><a href="{$contactFilename}" title="" id="main_menu5">Kapcsolat</a></li>
      <li><a href="{$registerFilename}" title="" id="main_menu6">Regisztráció</a></li>
      <li class="nobg"><a href="{$cartFilename}" title="" id="main_menu7" class="cart_menu">Kosár tartalma</a></li>
      </ul>
  </div>
  <!--main menu ends here-->


  <div id="content">
    <!--main starts here-->
    <div id="main">
      <!--left column starts here-->
      <div id="left_column">
        <!--left menu starts here-->
        <div class="left_menu">
          <ul>
	    
            <li><a href="{$szolg}" title="">Szolgáltatások</a></li>
            <li><a href="{$discountFilename}" title="">Újdonságok</a></li>
            <li><a href="{$articleListFilename}" title="">Tudnivalók</a></li>
          </ul>
        </div>
        <!--left menu ends here-->
        
        
        <!--category box starts here-->
        <div class="category_box">
          <h2 class="boxtitle">Szauna termékek</h2>
          
          {$categoryTree}
          
          <div class="bottom"></div>
        </div>
        <!--category box ends here-->
                
        
        <!--login box starts here-->
        <div class="login_box">
          <h2 class="boxtitle">Bejelentkezés</h2>
          {if $loguser===false}
         <form name="login" action="{$self}" method="post">
            <div>
              <p class="inputFocus">
                <input type="text" name="login_email" />
                <span>E-mail cím</span>
              </p>
            </div>
            
            <div>
              <p class="inputFocus">
                <input type="password" name="login_password"/>
                <span>Jelszó</span>
              </p>
            </div>
            <input type="hidden" name="dologin" value="2" />
            <div class="submit">
              <a href="{$forgotFilename}" title="">Elfelejtett jelszó</a>
              <input type="submit" value="BELÉPÉS" />
            </div>                    
          </form>

        {else}
  	    <div align="center" class="nameContainer">Köszöntjük, {$userbelepett}!</div>
        
        <a href="{$modifyFilename}" class="orangeLink">Adataim</a>
		    <a href="{$previousordersFilename}" class="orangeLink">Rendeléseim</a>
        <a href="{$logoutFilename}" class="greyLink">Kilépés</a>
         {/if}
        </div>
        <!--login box ends here-->
        
        
        <!--detailed search box starts here-->
        <div class="detailed_search_box">
	 
          <h2 class="boxtitle">Részletes Kereső</h2>
          
           <form name="advanced_search2" action="{$searchResultsFilename}" method="post">
            <div>
              <select name="manufacturer" id="gyarto">
		  {html_options options=$manufacturersAvaiable}               
              </select>
            </div>
            
            <div>
              <select name="categories[]" id="termek">
		{html_options options=$categoriesAvailable}               
              </select>
            </div>          
            
            <div>
              <input type="text" value="Megnevezés" name="searchpattern" id="kszoveg"/>
            </div>
            
            <div class="submit">
	      <input type="hidden" name="dosearch" value="Keresés" />
              <input type="submit" value="KERESÉS" />
            </div>                    
          </form>        
        </div>
        <!--detailed search box ends here-->
        
        
        <!--newsletter box starts here-->
        <a href="{$hirlevel}" title="" class="newsletter_link">Hírlevél feliratkozás</a>
        <!--newsletter box ends here-->        
        
        
        <!--contact box starts here-->
        <div class="contact_box">
          {$elerszoveg}
        </div>
        <!--contact box ends here-->
      </div>
      <!--left column ends here-->
            <div id="right_column">