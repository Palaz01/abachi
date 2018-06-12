<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />

	  <title>{$metaTitle}</title>	
  <meta name="description" content="{$metaDescription}" />
  <meta name="keywords" content="{$metaKeywords}" />
  <meta name="google-site-verification" content="KytVwp3TMxkxMavrauh5jSXdPnORAPLmnMxE373q9Fk" />
  {if $tinyMce}
  <script type="text/javascript" src="inc/tinymce/tiny_mce.js"></script>
  <script type="text/javascript" src="js/frontend-mce.js"></script>
  {/if}

	<link href="style.css?v=1" type="text/css" rel="stylesheet" />

	{if $metaCanonical!=''}
  <link rel="canonical" href="{$metaCanonical}.html" />
  {/if}

  <link href="css/jquery.selectbox.css" type="text/css" rel="stylesheet" />
  <link href="css/jquery.jcarousel.css" type="text/css" rel="stylesheet" />
  <link href="css/jquery.fancybox-1.3.1.css" type="text/css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">

  <script src="js/jquery.js?v=1" type="text/javascript"></script>
  <script src="js/script.js?v=1" type="text/javascript"></script>
  <script src="js/jquery.selectbox-0.6.1.js" type="text/javascript"></script>
  <script src="js/jquery.fancybox-1.3.1.js" type="text/javascript"></script>
  <script src="js/jquery.mousewheel-3.0.2.pack.js" type="text/javascript"></script>
  <script src="js/jquery.easing-1.3.pack.js" type="text/javascript"></script>
  <script src="js/jquery.jcarousel.js" type="text/javascript"></script>
  <script src="js/jFav_v1.0.js" type="text/javascript"></script>
  <script type="text/javascript" src="js/jquery.jmpopups-0.5.1.js"></script>
  <script type="text/javascript" src="js/jquery.masonry.min.js"></script>
  <script type="text/javascript" src="js/jquery.imagesloaded.min.js"></script>
  <script type="text/javascript" src="js/effects.js"></script>		
</head>
<body{if !isset($mainpageboxes)} class="subpage"{/if}>

<h1 class="header_h1">{$metaHeader}</h1>


<div id="content_wrapper">
  <!--main menu starts here-->
  <div id="main_menu">
    <div class="main-menu-wrapper">
      <div class="logo"></div>
      <ul class="main-menu-items">
        <li class="highlighted-menu"><a href="/" title="Egyedi szaunák">Egyedi szaunák</a></li>
        <li class="firstLevelMenu">
          <a href="#" title="Szauna galéria">Szauna galéria</a>
          <ul class="submenu">
            {foreach from=$topFixCategories item=topfix name=tfmf}
            <li>
              <a href="{$topfix.filename}{#ext#}" title="{$topfix.title}">{$topfix.title}</a>{if !$smarty.foreach.tfmf.last}{/if}
            </li>
            {/foreach}
          </ul>
        </li>
        <li><a href="{$szolg}" title="Szauna szolgáltatásaink">Szauna szolgáltatásaink</a></li>
        <li><a href="{$cegbemutato}" title="Bemutatóterem">Bemutatóterem</a></li>
        <li>
          <a href="{$webshopFilename}" title="Szauna termékek">Szauna termékek</a>
        </li>
        <!--<li><a href="{$discountFilename}" title="Újdonságok">Újdonságok</a></li>
        <li><a href="{$webshopFilename}" title="Webshop">Webshop</a></li>-->

        <!--
        <li><a href="{$searchFilename}" title="" id="main_menu2">Keresés</a></li>
        <li><a href="{$cegbemutato}" title="" id="main_menu3">Cégbemutató</a></li>
        <li><a href="{$pgDeliveryFilename}" title="" id="main_menu4">Szállítás</a></li>
        <li><a href="{$contactFilename}" title="" id="main_menu5">Kapcsolat</a></li>
        <li><a href="{$registerFilename}" title="" id="main_menu6">Regisztráció</a></li>
        <li class="nobg"><a href="{$cartFilename}" title="" id="main_menu7" class="cart_menu">Kosár tartalma</a></li>
        -->
      </ul>
    </div>
  </div>
  <!--main menu ends here-->


  {if isset($mainpageboxes)&&sizeof($mainpageboxes)!=0}
  <!--header starts here-->
  <div id="header">
    <!--share box starts here-->
    <!--<div class="share_box">
      <a href="http://twitter.com/?status=Most%20olvasom:{$ezazurl}" target="_blank" title="Megosztás Twitteren" class="csillag"></a>
      <a href="http://www.facebook.com/sharer.php?u={$ezazurl}" target="_blank" title="Facebook" class="facebook"></a>
    </div>-->
    <!--share box ends here-->
    
    
    <!--<img class="logo" src="images/logo.png" alt="" title="" />-->
    
    
    <!--header img pager starts here-->
    <div class="headerImgPager">
      {foreach from=$mainpageboxes item=box name=mpbi}
      <img {if $smarty.foreach.mpbi.first}class="first"{/if} src="{#pt#}upload/mainpagebox/{$box.image}&amp;w=951&amp;h=469&amp;zc=1" alt="" title="" width="951" height="496" />
      {/foreach}

      <div class="slider_text">
        <div>
          <h2>Egyedi infra szauna építés</h2>
          {foreach from=$mainpageboxes item=box name=mpbt}
          <p {if $smarty.foreach.mpbt.first}class="first"{/if}>{$box.boxtext}</p>
          {/foreach}
        </div>
        <a href="#" class="details-btn">részletek</a>
      </div>
      
      
      <div class="sliderControl">
        {foreach from=$mainpageboxes item=box name=mpbt}
        <a {if $smarty.foreach.mpbt.first}class="active"{/if} href="#" title=""></a>
        {/foreach}      
      </div>
    </div>

    <ul id="slider_products">
      <li><a href="#">Egyedi finn szauna építés</a></li>
      <li><a href="#">Egyedi infra szauna építés</a></li>
      <li><a href="#">Egyedi kombi szauna építés</a></li>
      <li><a href="#">Egyedi bio szauna építés</a></li>
      <li><a href="#">Egyedi só szauna építés</a></li>
      <li><a href="#">Egyedi hordó szauna ház építés</a></li>
      <li><a href="#">Egyedi gőzkabin építés</a></li>
      <li><a href="#">Egyedi kül- és beltéri dézsafürdő építés</a></li>
    </ul>
    <!--header img pager ends here-->
  </div>
  <!--header ends here-->
  {/if}


  <div id="content">
    <!--main starts here-->
    <div id="main">
      <div class="intro">
        <div class="fck">
          {$fooldalszoveg}
        </div>
      </div>
      <!--left column starts here-->
      <div id="left_column">
        <!--left menu starts here-->
        <div class="left_menu">
          <ul>
            <li>
              <a  title="Keresés" class="toggle_item"><span>Keresés</span> <i class="fa fa-chevron-down"></i></a>
              <div class="detailed_search_box toggle_content">
                <form name="advanced_search2" action="{$searchResultsFilename}" method="post">
                  <div>
                    <input type="text" placeholder="Keresett szöveg (terméknév)" name="searchpattern" id="kszoveg"/>
                  </div>
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
                  <div class="input-group">
                      <input type="text" value="Ár min" name="searchpattern" id="kszoveg" placeholder="Ár min."/>
                      <input type="text" value="Ár max" name="searchpattern" id="kszoveg" placeholder="Ár max"/>
                  </div>
                  <div class="submit">
                    <input type="hidden" name="dosearch" value="Keresés" />
                    <input type="submit" value="KERESÉS" />
                  </div>
                </form>
              </div>
            </li>
            <li>
              <a title="Szauna termékek" class="toggle_item"><span>Szauna termékek</span> <i class="fa fa-chevron-down"></i></a>
              <div class="category_box toggle_content">
                {$categoryTree}
              </div>
            </li>
            <li><a href="#" title="Újdonságok" class="left_menu_item">Újdonságok</a></li>
            <li><a href="{$cartFilename}" title="Kosár tartalma" class="left_menu_item">Kosár tartalma</a></li>
            <li>
              <a title="Bejelentkezés" class="toggle_item"><span>Bejelentkezés</span> <i class="fa fa-chevron-down"></i></a>
              <div class="login_box toggle_content">
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
            </li>
            <li><a href="{$registerFilename}" title="Regisztráció" class="left_menu_item">Regisztráció</a></li>
            <li><a href="{$pgDeliveryFilename}" title="Szállítás" class="left_menu_item">Szállítás</a></li>
            <li><a href="{$articleListFilename}" title="Tudnivalók" class="left_menu_item">Tudnivalók</a></li>
            <li><a href="#" title="Hírlevél feliratkozás" class="left_menu_item">Hírlevél feliratkozás</a></li>
            <li><a href="{$contactFilename}" title="Kapcsolat" class="left_menu_item">Kapcsolat</a></li>
            <li><a href="#" title="Elérhetőségek" class="left_menu_item">Elérhetőségek</a></li>
          </ul>
          <div class="contact_box">
            {$elerszoveg}
          </div>
        </div>
        <!--left menu ends here-->
        
        
        <!--category box starts here-->
    <!--<div class="category_box">
          <h2 class="boxtitle">Szauna termékek</h2>
          
          {$categoryTree}
          
          <div class="bottom"></div>
        </div>-->
        <!--category box ends here-->
                
        

        
        
        <!--detailed search box starts here-->
        <!--<div class="detailed_search_box">
	 
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
        </div>-->
        <!--detailed search box ends here-->
        
        
        <!--newsletter box starts here-->
        <!--<a href="{$hirlevel}" title="" class="newsletter_link">Hírlevél feliratkozás</a>-->
        <!--newsletter box ends here-->        
        
        
        <!--contact box starts here-->
        <!--<div class="contact_box">
          {$elerszoveg}
        </div>-->
        <!--contact box ends here-->
      </div>
      <!--left column ends here-->
            <div id="right_column">
              <!--search box starts here-->  
              <!--<div class="search_box">
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
              </div>-->
              <!--search box ends here-->                