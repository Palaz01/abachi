<?php
//phpinfo();exit;
/*
CREATE TABLE `mainpagebox` (`id` int( 11 ) unsigned NOT NULL AUTO_INCREMENT ,
`image` varchar( 32 ) CHARACTER SET ascii NOT NULL ,
`imgalt` varchar( 255 ) COLLATE utf8_hungarian_ci NOT NULL ,
`imgtitle` varchar( 255 ) COLLATE utf8_hungarian_ci NOT NULL ,
`boxtext` longtext COLLATE utf8_hungarian_ci NOT NULL ,
`lang` char( 1 ) CHARACTER SET ascii COLLATE ascii_bin NOT NULL ,
`sort` int( 11 ) unsigned NOT NULL ,
PRIMARY KEY ( `id` ) 
) ENGINE = MYISAM DEFAULT CHARSET = utf8 COLLATE = utf8_hungarian_ci ROW_FORMAT = DYNAMIC
INSERT INTO `ia_meta` (`id` ,
`filename` ,
`param` ,
`title` ,
`description` ,
`keywords` ,
`header` ,
`canonical` ,
`lang` 
)
VALUES ('17', 'webshop-oldal', 'mod=webshop', 'Webshop', 'Webshop', 'Webshop', 'Webshop', '', '1'
);

CREATE TABLE IF NOT EXISTS `page_images` (`id` int( 11 ) unsigned NOT NULL AUTO_INCREMENT ,
`pageid` int( 11 ) NOT NULL ,
`filename` char( 32 ) CHARACTER SET ascii NOT NULL ,
`title` varchar( 255 ) COLLATE utf8_hungarian_ci NOT NULL ,
`sort` int( 11 ) NOT NULL ,
`imgalt` varchar( 255 ) COLLATE utf8_hungarian_ci NOT NULL ,
`imgtitle` varchar( 255 ) COLLATE utf8_hungarian_ci NOT NULL ,
PRIMARY KEY ( `id` ) ,
KEY `pageid_index` ( `pageid` ) 
) ENGINE = MYISAM DEFAULT CHARSET = utf8 COLLATE = utf8_hungarian_ci;
*/

DEFINE ('OBSERVATION_PAGELIMIT', 10);

include ('./includes.php');
$self=selfUrl();

//echo "<pre>";
//print_r($_SERVER);exit;

$tpl = new Smarty();
$tpl->config_dir = './inc';                         
$tpl->template_dir = './templates/frontend';
$tpl->compile_dir = './cache/smarty';
$tpl->config_load('smarty.admin.conf');
$tpl->register_function('commify', 'commify');
$tpl->caching = 0;
//echo '222';exit;
if (isset($_GET['valid']) && $_GET['valid']!="")
{
  $vem=$_GET['valid'];
  $sql="select id from ia_user where aktiv=0 and hash=" . $db->qstr($_GET['valid']) . " LIMIT 1";
   
  $uu=$db->GetRow($sql);
  if ($uu["id"]!="") 
  {
    // Belépés aktiválás után
    $_SESSION['ui'] = $uu['id'];    
    $sql="update ia_user set aktiv=1 where id=".$uu["id"]." and aktiv=0 limit 1";
    $db->Execute($sql);
    echo "<script>alert('A megerősítés sikeres volt!');</script>";
    echo "<script>location.href='http://".$_SERVER["HTTP_HOST"]."';</script>";
  } else {
    echo "<script>alert('A megerősítés sikertelen volt!');</script>";
    echo "<script>location.href='http://".$_SERVER["HTTP_HOST"]."';</script>";  
  }
}

// Megállapítjuk a lekért URL kiterjesztését
$url = $_SERVER["REQUEST_URI"];
$tmp = explode (".", $url); 
$ext = $tmp[sizeof($tmp)-1]; // Utolsó pont utáni 
if (($qm = strpos($ext, "?")) !== false) { $ext = substr ($ext, 0, $qm); }
unset ($tmp);

if ($ext == "/") { $ext = "php"; } // Főoldalt kértük le, ugrás a php verzióhoz

$extHtml = false;
$extPhp = false;

$rewriteParam = array();



// PHP lekérés esetén a futtatandó modul megállapítása
if ($ext == "php") {
  $extPhp = true;
  $queryString = $_SERVER["QUERY_STRING"];
  
  
  if ($queryString == "") { $queryString = DEFAULT_PARAM; } // Ha nincs semmi paraméter, akkor a default modult (főoldal) kérjük le
  
  $meta = $db->GetRow("
                       SELECT *
                       FROM   " . TPX . "meta
                       WHERE  param=" . $db->qstr($queryString) . "
                       LIMIT  1 
  ");	
  if (count($meta) == 0) { $meta = array("title" => "", "description" => "", "keywords" => ""); }
}
// HTML lekérés esetén a futtatandó modul megállapítása
else if ($ext == "html") {
  $extHtml = true;
  $filename = getParam("p", false);
  $filename = substr($filename, 0, strlen($filename)-strlen(".html"));

  if (substr($filename, 0, 1) == "/") {
    $filename = substr($filename, 1);
  }

  // Esetleges extra paraméterek lekérdezése 
  if (strpos($filename, "_") !== false) {
    $tmp = explode("_", $filename);
    $filename = $tmp[0];
        
    for ($i=1;$i<sizeof($tmp);$i++) {
      $rewriteParam[] = $tmp[$i];
    }
  } 
  
  $meta = $db->GetRow("SELECT *
                       FROM   " . TPX . "meta
                       WHERE  filename=" . $db->qstr($filename) . "
                       LIMIT  1
  ");

  if ($meta === false) {
    // 404-es hiba
  }
  
  $queryString = $meta['param'];
}

//print_r($filename);exit;

$params = explode ("&", $queryString);
foreach ($params as $param) {
  $tmp = explode("=", $param);
  $name = $tmp[0];    
  $$name = $tmp[1]; // Meta paraméter változó adatainak deklarálása  
}

$metaTmpRaw = $db->GetArray("SELECT id, filename FROM " . TPX . "meta WHERE id<=999");
$metaTmp = array();
foreach ($metaTmpRaw as $row) {
  $metaTmp[$row['id']] = $row['filename'];
}

$webshopFilename           = $metaTmp[17] .  ".html";
$mainFilename              = $metaTmp[$commonMeta[$meta['lang']][MAIN_PAGE]] .  ".html";
$contactFilename           = $metaTmp[$commonMeta[$meta['lang']][CONTACT]] .  ".html";
$registerFilename          = $metaTmp[$commonMeta[$meta['lang']][REGISTER]] .  ".html";
$loginFilename             = $metaTmp[$commonMeta[$meta['lang']][LOGIN]] .  ".html";
$modifyFilename            = $metaTmp[$commonMeta[$meta['lang']][USER_MODIFY]] .  ".html";
$logoutFilename            = $metaTmp[$commonMeta[$meta['lang']][LOGOUT]] .  ".html";
$forgotFilename            = $metaTmp[$commonMeta[$meta['lang']][FORGOT_PASSWORD]] .  ".html";
$usercenterFilename        = $metaTmp[$commonMeta[$meta['lang']][USERCENTER]] .  ".html";
$previousordersFilename    = $metaTmp[$commonMeta[$meta['lang']][PREVIOUSORDERS]] .  ".html";
$pgDeliveryFilename        = $metaTmp[$commonMeta[$meta['lang']][PAGE_DELIVERY]] .  ".html";
$pgPaymentModeFilename     = $metaTmp[$commonMeta[$meta['lang']][PAGE_PAYMENT_MODE]] .  ".html";
$pgLegalFilename           = $metaTmp[$commonMeta[$meta['lang']][PAGE_LEGAL]] .  ".html";
$pgTermsConditionsFilename = $metaTmp[$commonMeta[$meta['lang']][PAGE_TERMS_CONDITIONS]] .  ".html";
$pgThankYouFilename        = $metaTmp[$commonMeta[$meta['lang']][PAGE_THANK_YOU]] .  ".html";
$cartFilename              = $metaTmp[$commonMeta[$meta['lang']][CART]] .  ".html";
$reviewFilename            = $metaTmp[$commonMeta[$meta['lang']][REVIEW]] .  ".html";
$articleListFilename       = $metaTmp[$commonMeta[$meta['lang']][ARTICLELIST]] .  ".html";
$manufacturerListFilename  = $metaTmp[$commonMeta[$meta['lang']][MANUFACTURERLIST]] .  ".html";
$searchResultsFilename     = $metaTmp[$commonMeta[$meta['lang']][SEARCHRESULTS]] .  ".html";
$searchFilename            = $metaTmp[$commonMeta[$meta['lang']][SEARCH]] .  ".html";
$discountFilename          = $metaTmp[$commonMeta[$meta['lang']][DISCOUNT]] .  ".html";
$cegbemutato          	   = $metaTmp[$commonMeta[$meta['lang']][BEMUTATK]] .  ".html";
$impr          	   = $metaTmp[$commonMeta[$meta['lang']][IMPR]] .  ".html";
$szolg          	   = $metaTmp[$commonMeta[$meta['lang']][SZOLG]] .  ".html";
$hirlevel          	   = $metaTmp[$commonMeta[$meta['lang']][HIRLEVEL]] .  ".html";

$vcim          	   = $metaTmp[$commonMeta[$meta['lang']][VCIM]] .  ".html";
$vfiz          	   = $metaTmp[$commonMeta[$meta['lang']][VFIZ]] .  ".html";
$vszall          	   = $metaTmp[$commonMeta[$meta['lang']][VSZALL]] .  ".html";

$linkekFilename          	   = $metaTmp[$commonMeta[$meta['lang']][LINKEK]] .  ".html";


$tpl->assign ("webshopFilename", $webshopFilename);
$tpl->assign ("mainFilename", $mainFilename);
$tpl->assign ("registerFilename", $registerFilename);
$tpl->assign ("contactFilename", $contactFilename);
$tpl->assign ("loginFilename", $loginFilename);
$tpl->assign ("modifyFilename", $modifyFilename);
$tpl->assign ("logoutFilename", $logoutFilename);
$tpl->assign ("forgotFilename", $forgotFilename);
$tpl->assign ("cartFilename", $cartFilename);
$tpl->assign ("reviewFilename", $reviewFilename);
$tpl->assign ("articleListFilename", $articleListFilename);
$tpl->assign ("usercenterFilename", $usercenterFilename);
$tpl->assign ("previousordersFilename", $previousordersFilename);
$tpl->assign ("manufacturerListFilename", $manufacturerListFilename);
$tpl->assign ("searchResultsFilename", $searchResultsFilename);
$tpl->assign ("searchFilename", $searchFilename);
$tpl->assign ("discountFilename", $discountFilename);
$tpl->assign ("cegbemutato", $cegbemutato);
$tpl->assign ("impr", $impr);
$tpl->assign ("szolg", $szolg);
$tpl->assign ("hirlevel", $hirlevel);
$tpl->assign ("linkekFilename", $linkekFilename);

$tpl->assign ("vcim", $vcim);
$tpl->assign ("vfiz", $vfiz);
$tpl->assign ("vszall", $vszall);

$tpl->assign ("pgDeliveryFilename", $pgDeliveryFilename);
$tpl->assign ("pgPaymentModeFilename", $pgPaymentModeFilename);
$tpl->assign ("pgLegalFilename", $pgLegalFilename);
$tpl->assign ("pgTermsConditionsFilename", $pgTermsConditionsFilename);
$tpl->assign ("pgThankYouFilename", $pgThankYouFilename);


$basicCartFilename = str_replace(".html", "", $cartFilename);

$tpl->assign ("self", $self);
$myuser = userId();
$tpl->assign ("loguser", $myuser);
if ($myuser!==false)
{
 $userData = getUserData(userId());

 $z1=$userData['lastname']." ".$userData['forename'];
 $tpl->assign ("comname", $z1);
 $tpl->assign ("userbelepett", $z1);
 $z2=$userData['email'];

 $tpl->assign ("userbelepettemail", $z2);
//kosárhoz adatok
 $z3=$userData['deliverycountry'];
 $z4=$userData['deliverycity'];
 $z5=$userData['deliverypostcode'];
 $z6=$userData['deliverystreet'];

 $z7=$userData['billingcountry'];
 $z8=$userData['billingcity'];
 $z9=$userData['billingpostcode'];
 $za=$userData['billingstreet'];
if ($_POST["tempcim"]!="")
{
  
  //ideiglenes cím érkezik
  $_SESSION["tempcim"]=1;
  $_SESSION["temporszag"]=$_POST["temporszag"];
  $_SESSION["tempvaros"]=$_POST["tempvaros"];
  $_SESSION["tempirszam"]=$_POST["tempirsz"];
  $_SESSION["tempstreet"]=$_POST["tempstreet"];
}
if ($_SESSION["tempcim"]==1)
{
  $z3=$_SESSION["temporszag"];
  $z4=$_SESSION["tempvaros"];
  $z5=$_SESSION["tempirszam"];
  $z6=$_SESSION["tempstreet"];
}

 $tpl->assign ("k_d_orszag", $z3);
 $tpl->assign ("k_d_varos", $z4);
 $tpl->assign ("k_d_irszam", $z5);
 $tpl->assign ("k_d_cim", $z6);

 $tpl->assign ("k_b_orszag", $z7);
 $tpl->assign ("k_b_varos", $z8);
 $tpl->assign ("k_b_irszam", $z9);
 $tpl->assign ("k_b_cim", $za);


}

unset($metaTmpRaw);
unset($metaTmp);



if ($_SESSION['megertette']!=1)
{
$_SESSION['megertette']=1;
$tpl->assign ("mustarmag", "1");
} else {
$tpl->assign ("mustarmag", "0");
}

$ezazurl=selfUrl();
$tpl->assign ("ezazurl", $ezazurl);

// nagy extra kereső
if (isset($_POST['donagykeres']) && $_POST['donagykeres']==1)
{
// keressünk cikkekben
if ($_POST['searchpattern']=='') { locationTo('/'); }
$q=$db->qstr("%".$_POST['searchpattern']."%");

$sql="select a.metaid, a.title, a.author, a.intro, a.image, m.filename from ia_article as a, ia_meta as m where (a.title like $q or a.author like $q or a.intro like $q or a.content like $q) and a.metaid=m.id";
$cikktalalat=$db->GetArray($sql);
foreach ($cikktalalat as $key => $value) {
  if (($value["image"] != "") && (file_exists("upload/articles/{$value["image"]}"))) { $cikktalalat[$key]["image"] = "upload/articles/" . $value["image"]; }
  else { $cikktalalat[$key]["image"] = false; }      
  
  if ($value["imgalt"] == "") { $cikktalalat[$key]["imgalt"] = $value["metatitle"]; }
  if ($value["imgtitle"] == "") { $cikktalalat[$key]["imgtitle"] = $value["metatitle"]; }
} 

// szolgáltatásokban
$sql="select a.metaid, a.title, a.author, a.intro, a.image, m.filename from szolgaltatasok as a, ia_meta as m where (a.title like $q or a.author like $q or a.intro like $q or a.content like $q) and a.metaid=m.id";
$szolgtalalat=$db->GetArray($sql);


$sql="select a.title, a.description, m.filename from ia_page as a, ia_meta as m where (a.title like $q or a.description like $q) and m.id=a.metaid and a.metaid<>104 and a.metaid<>131 and a.metaid<>119 and a.metaid<>3";
$stattalalat=$db->GetArray($sql);

$tpl->assign ("talalva", "1");

$x=count($cikktalalat);
if ($x==0) {$cikktalalat='X';}
$tpl->assign ("xtc", $x);
$x=count($szolgtalalat);
$tpl->assign ("xtsz", $x);
if ($x==0) {$szolgtalalat='X';}
$x=count($stattalalat);
$tpl->assign ("xsta", $x);
if ($x==0) {$stattalalat='X';}

$tpl->assign ("tcikk", $cikktalalat);
$tpl->assign ("tszol", $szolgtalalat);

if ($stattalalat!="X")
{
$statix = array();
$z=0;
    foreach ($stattalalat as $row) {
      $z++;
      $statix[$z]['title'] = $row["title"];
$zio=strip_tags($row["description"]);
$zizi=cropText($zio,200);
if ($zio!=$zizi) {$zizi.="...";}
      $statix[$z]['description'] = $zizi;
      $statix[$z]['filename'] = $row["filename"];
    }  
$stattalalat=$statix;
}


$tpl->assign ("tstat", $stattalalat);


}
// ---- nagy extra kereső



// Frame menü, legtöbbett rendelt termékek, négy bedrótozott kategória
// ----------------------------------------------------------------------------------------------------------
$importantManufacturerIds = getParam("manufacturers", explode("|", getSetting(SETTING_MANUFACTURERS_IN_FRAME, $meta['lang'])));
$importantManufacturers = array();
if (sizeof($importantManufacturerIds) != 0) {
  /*$importantManufacturers = $db->GetArray("SELECT      ma.title, me.filename
                                           FROM        " . TPX . "manufacturer AS ma
                                           INNER JOIN  " . TPX . "meta AS me
                                           ON          ma.`metaid-list` = me.id
                                           WHERE       me.lang = " . $db->qstr($meta['lang']) . " AND
                                                       ma.id IN (" . implode(",", $importantManufacturerIds). ")
                                           ORDER BY    ma.title
  ");*/
  $importantManufacturers = $db->GetArray("SELECT      ca.title, me.filename
                                           FROM        " . TPX . "categories AS ca
                                           INNER JOIN  " . TPX . "meta AS me
                                           ON          ca.metaid = me.id
                                           WHERE       me.lang = " . $db->qstr($meta['lang']) . " AND
                                                       ca.id IN (" . implode(",", $importantManufacturerIds). ")
                                           ORDER BY    ca.title
  ");                    
}
$tpl->assign ("importantManufacturers", $importantManufacturers);

$topProducts = $db->GetArray("SELECT      oi.productid, SUM(oi.quantity) AS summa, p.title, m.filename
                              FROM        " . TPX . "ordereditem AS oi
                              INNER JOIN  " . TPX . "products AS p
                              ON          oi.productid = p.id
                              INNER JOIN  " . TPX . "meta AS m
                              ON          p.metaid = m.id
                              GROUP BY    productid
                              ORDER BY    summa DESC
                              LIMIT       5

");
$tpl->assign ("topProducts", $topProducts);

$frameCategories = $db->GetArray("SELECT      c.title, m.filename
                                  FROM        " . TPX . "categories AS c
                                  INNER JOIN  " . TPX . "meta AS m
                                  ON          c.metaid = m.id
                                  WHERE       c.id IN (189,190,185,186)
");
$tpl->assign ("frameCategories", $frameCategories);

$jsMsg = "";

function parseCategoryTree($start) {
  global $db, $rootPath;

  $ret = "<ul>";
  
  
  $tmp = $db->GetArray ("SELECT      c.id, c.title, m.filename
                         FROM        " . TPX . "categories AS c
                         INNER JOIN  " . TPX . "meta AS m
                         ON          c.metaid = m.id
                         WHERE       c.parent='$start'
                         ORDER BY    c.sort, c.title
  ");
    
  foreach ($tmp as $row) {
    $ret .= '<li>';
    $di=parseCategoryTree($row['id']);
    //if ($di=="<ul></ul>") {$trg="onclick=\"document.getElementById('kszoveg').value=''; document.getElementById('termek').value='".$row['id']."'; document.advanced_search2.submit(); \"";} else {$trg="";}
    //$ret .= '<a href="#" title="" '.$trg.'>'.$row['title'].'</a>';
    
    $addDisplayBlock = false;
    
    if ($di!="<ul></ul>") { $href="#"; $addDisplayBlock = true; }
    else { $href=$row['filename'] . DEFEXT; }
    $ret .= '<a href="' . $href . '" title="'.$row['title'].' kategória">'.$row['title'].'</a>';
         
         
    if (($addDisplayBlock) && (in_array($row['id'], $rootPath))) {
      //var_dump ($di);
    
      //$di = str_replace('<ul>', '<ul style="display: block;">', $di);
      $di = preg_replace('/<ul>/', '<ul style="display: block;">', $di, 1); 
      
      
      
      
    }        
         
    $ret .= $di;
    $ret .= "</li>";

  }
  $ret .= "</ul>";
  //die ("<h1>Server temporarily down, please try again later.</h1>");
  return $ret;
}

function getCategoryTree() {
  return str_replace("<ul></ul>", '',parseCategoryTree('0'));
}

function regenerateProductTree($currentCategory) {
  global $db, $tpl, $rootPath;
  
  $lastcat = $currentCategory; $rootPath = array();
  $check=0;
  do {
    $rootPath[] = $lastcat;
    $tmp = (int)$db->GetOne("SELECT parent FROM " . TPX . "categories WHERE id=" . $db->qstr($lastcat) . " LIMIT 1");
    $lastcat = $tmp;
    ++$check;
  } while (($lastcat != 0) && ($check !== 50));


  $ct = getCategoryTree();
  $ct = str_replace('<ul style="display: block;"></ul>','', $ct);
  $tpl->assign ("categoryTree", $ct);
}

$rootPath = array();
$tpl->assign ("categoryTree", getCategoryTree());

// Belépés a headerből
 if (getParam("dologin", "") == "2") {    
    $email = getParam("login_email", "");
    $password = getParam("login_password", "");
    
     
      $row = $db->GetRow("SELECT id, password, loginnum
                          FROM   " . TPX . "user
                          WHERE  aktiv=1 and email = " . $db->qstr($email) . "
                          LIMIT  1
      ");
      
      
      if (($row) && (tep_validate_password($password, $row['password']))) {
        $_SESSION['ui'] = $row['id'];
        $db->Execute ("UPDATE   " . TPX . "user
                       SET      lastlogin = NOW(),
                                loginnum = " . (((int)$row['loginnum']) + 1) . "
                       WHERE    id = " . $db->qstr($row['id']) . "
                       LIMIT    1
        ");            
        
        $lastPage = $mainFilename;
        if (array_key_exists("lp", $_SESSION)) { $lastPage = $_SESSION["lp"]; }
        unset ($_SESSION["lp"]);
        
        locationTo ($lastPage);
      }
      else {
        $X_uzenet = "Hibás adatok, vagy nem megerősített regisztráció!";
        $tpl->assign ("X_uzenet", $X_uzenet);
      }                          
    }
//regisztráció msgbox
if (isset($_SESSION['vacakreg']) && $_SESSION['vacakreg']==1)
{
$X_uzenet = "Köszönjük a regisztrációját az Abachi Szauna webáruházában, a kiküldött aktiváló levélben leírtak szerint regisztrációját meg kell erősítenie!";
$tpl->assign ("X_uzenet", $X_uzenet);
$_SESSION['vacakreg']=99;
//levélküldés - de jó hogy nem volt benne...
$kod=md5($_SESSION['vacakemail']);
$mail = new TplMail();
      	$mail->SetVar ("validkod", $kod);
      	$mail->SetVar ("name", $_SESSION['vacakuser']);
      	$mail->GetBody ("./mail/ujreg.mail");
      	$mail->AddAddress ($_SESSION['vacakemail']);
      	$mail->Subject = "Új regisztráció (" . DEFDOMAIN . ")";
      	$mail->Send();

}

if ($_SESSION['vacakreg']==2)
{
$X_uzenet = $_SESSION['vacakuzi'];
$tpl->assign ("X_uzenet", $X_uzenet);
$_SESSION['vacakreg']=99;
}

//nyitóoldali szöveg
$sql="select description from ia_page where metaid=1";
$row=$db->GetRow($sql);
 $tpl->assign ("fooldalszoveg", $row['description']);
$sql="select description from ia_page where metaid=3";
$row=$db->GetRow($sql);
 $tpl->assign ("kapcsszoveg", $row['description']);
$sql="select description from ia_page where metaid=119";
$row=$db->GetRow($sql);
 $tpl->assign ("elerszoveg", $row['description']);

// ----------------------------------------------------------------------------------------------------------
// menüben és keresőben a két select
$tmp = $db->GetArray("SELECT      c.*
                          FROM        " . TPX . "categories AS c
                          INNER JOIN  " . TPX . "meta AS m
                          ON          c.metaid = m.id
                          WHERE       m.lang = " . $db->qstr($meta['lang']) . "
                          ORDER BY    c.parent
    ");
    $categoriesAvailable = array("*" => "Mindegy");
    foreach ($tmp as $row) {
      $sql="select title from ia_categories where id=".$row["parent"];
      $mm=$db->GetRow($sql);
      $zz="";
      if (isset($m["title"]) && $mm["title"]!="") {$zz=$mm["title"]."->";}
      $categoriesAvailable[$row["id"]] = $zz.$row["title"];
    }           
    
    $tmp = $db->GetArray("SELECT      ma.*
                          FROM        " . TPX . "manufacturer AS ma
                          INNER JOIN  " . TPX . "meta AS me
                          ON          ma.metaid = me.id
                          WHERE       me.lang = " . $db->qstr($meta['lang']) . "
                          ORDER BY    ma.title
    ");               
    $manufacturersAvaiable = array("*" => "Mindegy");
    foreach ($tmp as $row) {
      $manufacturersAvaiable[$row["id"]] = $row["title"];
    }
    unset ($tmp);
    
    $tpl->assign ("categoriesAvailable", $categoriesAvailable);
    $tpl->assign ("manufacturersAvaiable", $manufacturersAvaiable);

//láblécben a cikkek
 
$articles = $db->GetArray("SELECT SQL_CALC_FOUND_ROWS a.title, a.intro, a.image, a.artdate, a.imgtitle, a.imgalt, a.morelink, a.moretitle,  
                                                          m.filename, m.title AS metatitle
                               FROM                       " . TPX . "article AS a
                               INNER JOIN                 " . TPX . "meta AS m
                               ON                         a.metaid = m.id
                               WHERE                      m.lang = " . $db->qstr($meta['lang']) . " AND
                                                          a.public = " . $db->qstr('1') . "    
                               ORDER BY                   a.artdate DESC
                               LIMIT                      2
    ");
    
    foreach ($articles as $key => $value) {
      //$articles[$key]["artdate"] = formatDate($value["artdate"]);
      if (($value["image"] != "") && (file_exists("upload/articles/{$value["image"]}"))) { $articles[$key]["image"] = "upload/articles/" . $value["image"]; }
      else { $articles[$key]["image"] = false; }      
      
      if ($value["imgalt"] == "") { $articles[$key]["imgalt"] = $value["metatitle"]; }
      if ($value["imgtitle"] == "") { $articles[$key]["imgtitle"] = $value["metatitle"]; }
      
      $articles[$key]["intro"] = cropText ($articles[$key]["intro"], 200);
      
    }
    
    $tpl->assign ("articles", $articles);

$lapok = $db->GetArray("select * from ia_page");

 //foreach ($lapok as $key => $value) {
      
  //    $laps[$key]["intro"] = $lapok[$key]["intro"];
      
  //  }

$tpl->assign ("lapok", $lapok);


// 2013-02-26
$tmpCatIds = array(267, 266, 270, 286, 276, 353, 268, 277);
$topFixCategories = array();
foreach ($tmpCatIds as $tmpCatId) {
  $tmp = $db->GetRow("SELECT      c.title, m.filename
                      FROM        " . TPX . "categories AS c
                      INNER JOIN  " . TPX . "meta AS m
                      ON          c.metaid = m.id
                      WHERE       c.id = " . $db->qstr($tmpCatId) . "
                      LIMIT       1");
  $topFixCategories[] = $tmp;                      
} 
$tpl->assign ("topFixCategories", $topFixCategories);

switch ($mod) {
  // Főoldal
  // ----------------------------------------------------------------------------------------------------------
  case "main":
  case "webshop":
    // 2013-02-26
    
    if ($mod != "webshop") {
      $boxes = $db->GetArray("SELECT       *
                              FROM         mainpagebox
                              ORDER BY     sort
      ");
      foreach ($boxes as $k => $v) {
        if ($v['boxtext'] == '') {
          $boxes[$k]['boxtext'] = 'Egyedi szaunák építése - Kérjen ajánlatot most! Tel: 06 70 123 4567 | E-mail: info@abachiszauna.hu';
        }
      }

      $tpl->assign ("mainpageboxes", $boxes);
    }
    
    $productsOnMainpage = $db->GetArray("SELECT      pro.*, m.filename, m.title AS metatitle,
    
                                                     (SELECT     COUNT(id) 
                                                      FROM       " . TPX . "product_editions 
                                                      WHERE      productid=pro.id) AS editioncount 
    
                                         FROM        " . TPX . "product_on_mainpage AS pom
                                         INNER JOIN  " . TPX . "products AS pro
                                         ON          pom.productid = pro.id
                                         INNER JOIN  " . TPX . "meta AS m
                                         ON          pro.metaid = m.id
                                         ORDER BY    pom.sort
    ");
    foreach ($productsOnMainpage as $key => $value) {
    $ziz=$value["description"];
    $zio=strip_tags($ziz);
$ziz=cropText($zio,200);
if ($zio!=$ziz) {$ziz.=" ";}

$productsOnMainpage[$key]["description"]=$ziz;

      
      
      if (($value["image"] != "") && (file_exists("upload/products/{$value["image"]}"))) { $productsOnMainpage[$key]["image"] = "upload/products/" . $value["image"]; }
      else { $productsOnMainpage[$key]["image"] = "images/nincs-kep.jpg"; }
      
      if ($value["imgalt"] == "") { $productsOnMainpage[$key]["imgalt"] = $value["metatitle"]; }
      if ($value["imgtitle"] == "") { $productsOnMainpage[$key]["imgtitle"] = $value["metatitle"]; }


      if ($value["editioncount"] == 0) {
        $productsOnMainpage[$key]["addToCartFilename"] = $basicCartFilename . "_" . URL_PARAM_ADDCART . "_" . $value["id"];
      }
      else {
        $productsOnMainpage[$key]["addToCartFilename"] = $value["filename"];
      }
      $price = getPriceData($value["price"], $value['vat']);      
      $priced = getPriceData($value["priced"], $value['vat']);
      
      $productsOnMainpage[$key]["finalprice"] = $price;
      if ($priced != "") { $productsOnMainpage[$key]["finalprice"] = $priced; } 
    }                               
    $tpl->assign ("productsOnMainpage", $productsOnMainpage);
    
    $highlightedManufacturers = $db->GetArray("SELECT      ma.title, ma.image, me.filename, ma.imgalt, ma.imgtitle
                                               FROM        " . TPX . "manufacturer AS ma
                                               INNER JOIN  " . TPX . "meta AS me
                                               ON          ma.`metaid-list` = me.id
                                               WHERE       ma.id IN (113,119,135,69,103)                                               
    ");
    $tpl->assign ("highlightedManufacturers", $highlightedManufacturers);
    
    $tpl->assign ("monthName", monthToString(date("m")));
   
    $template = "main.tpl";
    if ($mod == "webshop") { $template = "webshop-subpage.tpl"; }
    break;
  // ----------------------------------------------------------------------------------------------------------

  // Bejelentkezés
  // ----------------------------------------------------------------------------------------------------------
  case "login":
  
    $email = getParam("login_email", "");
    $password = getParam("login_password", "");
    
    $msg = array();
  
    if (getParam("dologin", false) !== false) {
      $row = $db->GetRow("SELECT id, password, loginnum
                          FROM   " . TPX . "user
                          WHERE  email = " . $db->qstr($email) . "
                          LIMIT  1
      ");
      
      
      if (($row) && (tep_validate_password($password, $row['password']))) {
        $_SESSION['ui'] = $row['id'];
        $db->Execute ("UPDATE   " . TPX . "user
                       SET      lastlogin = NOW(),
                                loginnum = " . (((int)$row['loginnum']) + 1) . "
                       WHERE    id = " . $db->qstr($row['id']) . "
                       LIMIT    1
        ");            
        
        $lastPage = $mainFilename;
        if (array_key_exists("lp", $_SESSION)) { $lastPage = $_SESSION["lp"]; }
        unset ($_SESSION["lp"]);
        
        locationTo ($lastPage);
      }
      else {
        $msg[] = "Hibás e-mail cím vagy jelszó!";
      }                          
    }

    $tpl->assign ("email", htmlspecialchars($email));    
    $tpl->assign ("errors", $msg);
    
    $template = "login.tpl";
  
    break;

 // ----------------------------------------------------------------------------------------------------------
  // Szolgáltatások listázása
  // ----------------------------------------------------------------------------------------------------------
  
  case "szolgaltatas":

    $step = ARTICLE_PER_PAGE;
    
    $pg = 0;
    $orderDir = "ASC";
    $ascMarker = "";
    if (array_key_exists(0, $rewriteParam)) { 
      $pg = (int)$rewriteParam[0];
      if (substr($rewriteParam[0], strlen($rewriteParam[0])-1, 1) == ARTICLEIST_ASC_MARKER) { 
        $orderDir = "ASC"; 
        $ascMarker = ARTICLEIST_ASC_MARKER;
      } 
    }         

    if ($mod == "szolgaltatas") {

      //if (!isset($item)) { locationTo ("/"); }
                  
      cookieSet("apg", $pg);  
      $articles = $db->GetArray("SELECT SQL_CALC_FOUND_ROWS a.title, a.intro, a.artdate, a.imgalt, a.imgtitle, a.image, a.morelink, a.moretitle,  
                                                            m.filename, m.title AS metatitle
                                 FROM                       szolgaltatasok AS a
                                 INNER JOIN                 ia_meta AS m
                                 ON                         a.metaid = m.id
                                 WHERE                      m.lang = " . $db->qstr($meta['lang']) . " AND
                                                            a.public = " . $db->qstr('1') . "    
                                 ORDER BY                   a.sorrend $orderDir
                                 LIMIT                      " . $pg * $step . ", " . $step . "
      ");
    }
    else if ($mod == "articletag") {
      $tagId = getParam("tagid", false);
      if ($tagId === false) { $tagId = cookieGet("tagId", false); }
      if (!$tagId) { locationTo ("/"); }
      $tagId = (int)$tagId;
      
      cookieSet("tagId", $tagId);
            
      $articles = $db->GetArray("SELECT SQL_CALC_FOUND_ROWS a.title, a.intro, a.artdate, a.imgalt, a.imgtitle, a.image, a.morelink, a.moretitle,  
                                                            m.filename, m.title AS metatitle
                                 FROM                       szolgaltatasok AS a
                                 INNER JOIN                 ia_meta AS m
                                 ON                         a.metaid = m.id
                                 INNER JOIN                 tag_to_content AS x
                                 ON                         m.id = x.contentid AND
                                                            x.tagid = " . $db->qstr($tagId) . "
                                 WHERE                      m.lang = " . $db->qstr($meta['lang']) . " AND
                                                            a.public = " . $db->qstr('1') . "    
                                 ORDER BY                   a.sorrend $orderDir
                                 LIMIT                      " . $pg * $step . ", " . $step . "
      ");
    }
    else {
    
      // Új keresés, form elküldve, onnan kell kinyerni a keresendő szót
      if (getParam("searchhidden", false) !== false) {
        $searchStr = getParam("searchpattern", "");
        cookieSet ("articlesearchpattern", $searchStr);
      }
      // Régi keresés lapozása, sütiből kell kinyernyi a keresendő szót
      else {
       $searchStr = cookieGet("articlesearchpattern", "");
      }
      
      if ($searchStr === "") {
        cookieDel ("articlesearchpattern");
        locationTo ("/");
      }
      cookieSet ("articlesearchpattern", $searchStr);
      
      $tpl->assign ("searchStr", $searchStr);
      
      $searchStr = $db->qstr("%$searchStr%");
       
      $articles = $db->GetArray("SELECT SQL_CALC_FOUND_ROWS a.title, a.intro, a.artdate, a.imgalt, a.imgtitle, a.image, a.morelink, a.moretitle,  
                                                            m.filename, m.title AS metatitle
                                 FROM                       szolgaltatasok AS a
                                 INNER JOIN                 ia_meta AS m
                                 ON                         a.metaid = m.id
                                 WHERE                      (m.lang = " . $db->qstr($meta['lang']) . " AND
                                                            a.public = " . $db->qstr('1') . ") AND
                                                            (a.title LIKE $searchStr OR
                                                             a.intro LIKE $searchStr OR
                                                             a.content LIKE $searchStr)     
                                 ORDER BY                   a.sorrend $orderDir
                                 LIMIT                      " . $pg * $step . ", " . $step . "
      ");
       
    }
      
    foreach ($articles as $key => $value) {
      $articles[$key]["artdate"] = formatDate($value["artdate"]);
      if (($value["image"] != "") && (file_exists("upload/articles/{$value["image"]}"))) { $articles[$key]["image"] = "upload/articles/" . $value["image"]; }
      else { $articles[$key]["image"] = false; }      
      
      if ($value["imgalt"] == "") { $articles[$key]["imgalt"] = $value["metatitle"]; }
      if ($value["imgtitle"] == "") { $articles[$key]["imgtitle"] = $value["metatitle"]; }
      
      //$articles[$key]["intro"] = cropText ($articles[$key]["intro"], 200);
      
    }
    
    $tpl->assign ("articlesz", $articles);    
    
    $totalTmp = $db->GetRow("SELECT FOUND_ROWS() AS cnt;");
    $total = $totalTmp['cnt'];
    
    $baseFn = $meta['filename'];    
    $prev = true; $prevPage = false;
    $next = true; $nextPage = false;
    
    
    if ($pg == 0) { $prev = false; } 
    else { $prevPage = $pg-1; }
    if ($total <= (($pg+1)*$step)) { $next = false; }
    else { $nextPage = $pg+1; }
    
    $nextPage = $baseFn . "_" . $nextPage . $ascMarker . DEFEXT;
    if (($prevPage != 0) || ($ascMarker != "")) { $prevPage = $baseFn . "_" . $prevPage . $ascMarker . DEFEXT; }
    else { $prevPage = $baseFn . DEFEXT; }
        
    $pages = array();
    for ($i=0;$i<=floor(($total-1)/$step);$i++) {
      $row['filename'] = $baseFn . "_" . $i . $ascMarker . DEFEXT;
      if (($i==0) && ($ascMarker == "")) { $row['filename'] = $baseFn . DEFEXT; }
      
      $row['current'] = false; 
      if ($i==$pg) { $row['current'] = true; }
      
      $row['caption'] = $i+1;
      
      $pages[] = $row; 
    }
    
    $tpl->assign ("next", $next);
    $tpl->assign ("prev", $prev);
    $tpl->assign ("prevPage", $prevPage);
    $tpl->assign ("nextPage", $nextPage);    
    $tpl->assign ("pages", $pages);
    $tpl->assign ("ascMarker", $ascMarker);
    $tpl->assign ("baseFn", $baseFn);
    $tpl->assign ("tartalom", "szolgaltataslist.tpl");
    
    $template = "belsokeret.tpl";     
  
    
    break;
// ----------------------------------------------------------------------------------------------------------
  // Szolgáltatás Megtekintése
  // ----------------------------------------------------------------------------------------------------------
  case "szolgaltatasok":    
    if (!isset($item)) { locationTo ("/"); }
    
    $res = Sql("SELECT      a.*, m.title AS metatitle
                FROM        szolgaltatasok AS a
                INNER JOIN  ia_meta AS m
                ON          a.metaid = m.id
                WHERE       a.id=" . $db->qstr($item) . " AND
                            a.public=" . $db->qstr('1') . "
                LIMIT       1
    ");
    $data = $res->FetchRow(); 
    $data["artdate"] = formatDate($data["artdate"]);
    
    if (($data["image"] != "") && (file_exists("upload/articles/{$data["image"]}"))) { $data["image"] = "upload/articles/" . $data["image"]; }
    else { $data["image"] = false; }      
    
    if ($data["imgalt"] == "") { $data["imgalt"] = $data["metatitle"]; }
    if ($data["imgtitle"] == "") { $data["imgtitle"] = $data["metatitle"]; }
    
    $authorData = array();
    if ($data['userconnected'] != 0) {
      $res = Sql("SELECT      u.username, m.filename, i.filename AS imagefilename, i.title AS imagetitle
                  FROM        users AS u       
                  INNER JOIN  ia_meta AS m
                  ON          u.metaid = m.id
                  LEFT JOIN   users_images AS i
                  ON          u.id = i.userid AND
                              i.default = " . $db->qstr('1') . "
                  WHERE       u.status = " . $db->qstr('1') . " AND
                              u.id = " . $db->qstr($data['userconnected']) . "
                  LIMIT       1
      ");      
      $authorData = $res->FetchRow();      
      if ($authorData) {
        if ($authorData['imagefilename'] == '') { 
          $authorData["imagefilename"] = USER_NO_IMAGE_URL;
          $authorData["imagetitle"] = USER_NO_IMAGE_TITLE; 
        }
        else {
          $authorData["imagefilename"] = "upload/userimages/" . $authorData["imagefilename"];
        }
      }  
      else {
        $data['userconnected'] = 0;
        $authorData = array();
      }    
    }
    
    $res = Sql("SELECT    *
                FROM      szolgaltatas_images
                WHERE     artid = " . $db->qstr($item) . "
                ORDER BY  sort
    ");
    $images = array();
    if ($res->RecordCount() != 0) {
      while ($row = $res->FetchRow()) { $images[] = $row; }
    }                                     
    
    $res = Sql("SELECT      n.*, m.filename
                FROM        szolgaltatasok_con_categories AS a
                INNER JOIN  newscat AS n
                ON          a.catid = n.id
                INNER JOIN  ia_meta AS m
                ON          n.metaid = m.id
                WHERE       artid = " . $db->qstr($item) . "
                ORDER BY    sort
    ");
    $categories = array();
    if ($res->RecordCount() != 0) {
      while ($row = $res->FetchRow()) { $categories[] = $row; }
    }
    
    
    $similarArticles = array();
    $first = true; $sqlCatWhere = ""; 
    foreach ($categories as $cat) {
      if (!$first) { $sqlCatWhere .= ","; } 
      $sqlCatWhere .= $cat['id'];
      $first = false; 
    }
    if ($sqlCatWhere != "") {
      $res = Sql("SELECT      a.id, a.title, m.filename, COUNT(a.id) AS tagno
                  FROM        szolgaltatas_con_categories AS x
                  INNER JOIN  szolgaltatasok AS a 
                  ON          x.artid = a.id AND
                              x.catid IN ($sqlCatWhere) 
                  INNER JOIN  ia_meta AS m 
                  ON          a.metaid = m.id
                  INNER JOIN  newscat AS n 
                  ON          x.catid = n.id
                  WHERE       a.id <> " . $db->qstr($item) . "
                  GROUP BY    a.id
                  ORDER BY    tagno DESC, title ASC
      ");      
      while ($row = $res->FetchRow()) { $similarArticles[] = $row; }
    }
$zum=0;

      if ($kulcs!="")
{
      $sql="select distinct contentid from tag_to_content where tagid in (".$kulcs.") and contentid<>".$data['metaid'];
      $res=Sql($sql);
      $num=0;
      while ($row=$res->FetchRow())
      {
	
	$mmetaid=$row['contentid'];
	$sql="select a.title, m.filename from szolgaltatasok a, ia_meta m where a.metaid=m.id and a.metaid=$mmetaid and a.public=1 LIMIT 1";
	$rr=$db->GetRow($sql);
	if ($rr['title']!="")
	{
	$num++;
	if ($num<6) {$similarArticles[]=$rr;}
	}
      }

      $sql="select a.id, a.title, m.filename from szolgaltatasok a, ia_meta m where a.metaid=m.id and a.id<>". $db->qstr($item) . " and " . $cimkeres . " order by a.sorrend limit 5";
}

/*Itt kikutatjuk a szolgáltatásokat
*/

if ($zum>0)
{
//vannak címkék
$num=0;
for($x=1;$x<=$zum;$x++)
{
$ck=$cimszavak[$x]['cimke'];
$sql="select f.fogalom, m.filename from kisokos f, ia_meta m where f.fogalom='$ck' and f.metaid=m.id and f.lathato=1";
$rr=$db->GetRow($sql);
	if ($rr['fogalom']!="")
	{
	$num++;
	$kapcsfogalmak[$num]['filename']=$rr['filename'];
	$kapcsfogalmak[$num]['title']=$rr['fogalom'];
	}
}
}
   
    /*$lastPage = cookieGet("apg", 0);
    $backFilename = $articlesFilename;
    if ($lastPage != 0) { $backFilename = str_replace(DEFEXT, "_$lastPage" . DEFEXT, $backFilename); }*/
    
    $tpl->assign ("similarArticles", $similarArticles);
    $tpl->assign ("kapcsfogalmak", $kapcsfogalmak);
    $tpl->assign ("data", $data);    
    $tpl->assign ("images", $images);
    $tpl->assign ("authorData", $authorData);
    $tpl->assign ("categories", $categories);
    //$tpl->assign ("backFilename", $backFilename);
        
    if (($data['registeredonly'] == 1) && (userId() === false)) { $tpl->assign ("tartalom", "szolgaltatasview-register.tpl"); }
    else {  $tpl->assign ("tartalom", "szolgaltatasview.tpl"); }
          $template = "belsokeret.tpl";
    break;
  

  // Regisztráció
  // ----------------------------------------------------------------------------------------------------------
  case "register":    
    $formAction = $registerFilename;
    $_SESSION["hazater"]=$_GET["goback"];
    if (userId() !== false) { locationTo ($modifyFilename); }
    
    $tpl->assign ("cISO", $cISO);
    
    
    if (getParam("regok", false) !== false) {
      $jsMsg = "Sikeres regisztráció!";
      $_SESSION['vacakreg']=1;
      
     locationTo ($mainFilename);
      //$jsJump = "reg";
    }
    
    $gender = (int)getParam("gender", 2); if (($gender != 1) && ($gender != 2)) { $gender = 2; }  
    $lastname = getParam("lastname", "");
    $forename = getParam("forename", "");
    $company = getParam("company", "");
    $telephone = getParam("telephone", "");
    $fax = getParam("fax", "");
    $email = getParam("email", "");    
    $password1 = getParam("password1", "");
    $password2 = getParam("password2", "");    
    $deliverypostcode = getParam("deliverypostcode", "");
    $deliverycity = getParam("deliverycity", "");
    $deliverystreet = getParam("deliverystreet", "");
    $deliverycountry = getParam("deliverycountry", "Magyarország");    
    $deliverycounty = getParam("deliverycounty", "");
    $billingpostcode = getParam("billingpostcode", "");
    $billingcity = getParam("billingcity", "");
    $billingstreet = getParam("billingstreet", "");
    $billingcountry = getParam("billingcountry", "Magyarország");    
    $billingcounty = getParam("billingcounty", "");
    
    if (getParam("regstarted", false) !== false) {  
      $errors = array();      
      if ($lastname == "") { $errors[] = "Kérjük adja meg vezetéknevét!"; }        
      if ($forename == "") { $errors[] = "Kérjük adja meg keresztnevét!"; }
      if (!validEmail($email)) { $errors[] = "Kérjük helyes e-mail címet adjon meg!"; }
            
      if ($billingpostcode == "") { $errors[] = "Kérjük adja meg a számlázási cím irányítószámát!"; } 
      if ($billingcity == "") { $errors[] = "Kérjük adja meg a számlázási cím város mezőjét!"; }
      if ($billingstreet == "") { $errors[] = "Kérjük adja meg a számlázási cím utca mezőjét!"; }      
      
      if ($telephone == "") { $errors[] = "Kérjük adja meg telefonszámát!"; }
            
      if ($password1 == "") { $errors[] = "Kérjük adja meg jelszavát!"; }
      if ($password1 != $password2) { $errors[] = "A beírt jelszavaknak meg kell egyezniük!"; }
      
      if (sizeof($errors) == 0) {
        
        $emailExists = $db->GetRow("SELECT   COUNT(*) AS cnt
                                    FROM     " . TPX . "user
                                    WHERE    email=" . $db->qstr($email) . "
                                    LIMIT    1
        ");
        if ($emailExists['cnt'] != 0) {
          $errors[] = "A megadott e-mail címmel már regisztráltak!";
        }
        
        if (sizeof($errors) == 0) {
$sql="INSERT INTO " . TPX . "user
                         VALUES      (
                                      NULL,
                                      " . $db->qstr($gender) . ",
                                      " . $db->qstr($lastname) . ",
                                      " . $db->qstr($forename) . ",
                                      " . $db->qstr($company) . ",
                                      " . $db->qstr($telephone) . ",
                                      " . $db->qstr($email) . ",
                                      " . $db->qstr($fax) . ",
                                      " . $db->qstr(tep_encrypt_password($password1)) . ",
                                      " . $db->qstr($deliverypostcode) . ",
                                      " . $db->qstr($deliverycity) . ",
                                      " . $db->qstr($deliverystreet) . ",
                                      " . $db->qstr($deliverycountry) . ",
                                      " . $db->qstr($deliverycounty) . ",
                                      " . $db->qstr($billingpostcode) . ",
                                      " . $db->qstr($billingcity) . ",
                                      " . $db->qstr($billingstreet) . ",
                                      " . $db->qstr($billingcountry) . ",
                                      " . $db->qstr($billingcounty) . ",
                                      NOW(),
                                      " . $db->qstr(getClientIp()) . ",
                                      NOW(),
                                      0,
                                      0,
                                      '" . md5($email)."' 
                                     )";

          $db->Execute ($sql);
          
          $_SESSION['vacakemail']=$email;
          //$_SESSION['vacakuser']=$forename." ".$lastname;
          $_SESSION['vacakuser']=$lastname." ".$forename;
          locationTo ($registerFilename . "?regok=1");
        }
      }
      if (sizeof($errors) != 0) {
        //$tpl->assign ("regErrors", implode("<br />", $errors));       
        $tpl->assign ("errors", $errors);
      }        
    }  
    
      
    
    
    $tpl->assign ("gender", $gender);
    $tpl->assign ("lastname", htmlspecialchars($lastname));
    $tpl->assign ("forename", htmlspecialchars($forename));
    $tpl->assign ("company", htmlspecialchars($company));
    $tpl->assign ("telephone", htmlspecialchars($telephone));
    $tpl->assign ("fax", htmlspecialchars($fax));
    $tpl->assign ("email", htmlspecialchars($email));    
        
    $tpl->assign ("deliverypostcode", htmlspecialchars($deliverypostcode));
    $tpl->assign ("deliverycity", htmlspecialchars($deliverycity));
    $tpl->assign ("deliverystreet", htmlspecialchars($deliverystreet));
    $tpl->assign ("deliverycountry", htmlspecialchars($deliverycountry));
    $tpl->assign ("deliverycounty", htmlspecialchars($deliverycounty));
    
    $tpl->assign ("billingpostcode", htmlspecialchars($billingpostcode));
    $tpl->assign ("billingcity", htmlspecialchars($billingcity));
    $tpl->assign ("billingstreet", htmlspecialchars($billingstreet));
    $tpl->assign ("billingcountry", htmlspecialchars($billingcountry));
    $tpl->assign ("billingcounty", htmlspecialchars($billingcounty));
    
    
    $template = "register.tpl";
    break;
  // ----------------------------------------------------------------------------------------------------------
 
  // Kijelentkezés
  case "logout":
    unset ($_SESSION['ui']);
    locationTo ($mainFilename);
  
    break;
  // ----------------------------------------------------------------------------------------------------------    
 
  // Adatmódosítás
  // ----------------------------------------------------------------------------------------------------------
  case "usermodify":
    if (userId() === false) { locationTo ($mainFilename); }
    
    $tpl->assign ("cISO", $cISO);        
  
    $data = $db->GetRow ("SELECT *
                          FROM   " . TPX . "user
                          WHERE  id=" . $db->qstr(userId()) . "
                          LIMIT  1
    ");
    
    $errors = array();
    
    if (getParam("modok", false) !== false) {
      $jsMsg = "Sikeres adatmódosítás!";      
    }
    
    $lastname = getParam("lastname", $data['lastname']);
    $forename = getParam("forename", $data['forename']);
    $gender = getParam("gender", $data['gender']);
    $telephone = getParam("telephone", $data['telephone']);
    $fax = getParam("fax", $data['fax']);
    $email = getParam("email", $data['email']);
    $company = getParam("company", $data['company']);
    
    $opassword = getParam("opassword", "");
    $password1 = getParam("password1", "");    
    $password2 = getParam("password2", "");    
    
    $deliverypostcode = getParam("deliverypostcode", $data['deliverypostcode']);
    $deliverycity = getParam("deliverycity", $data['deliverycity']);
    $deliverystreet = getParam("deliverystreet", $data['deliverystreet']);
    $deliverycountry = getParam("deliverycountry", $data['deliverycountry']);
    $deliverycounty = getParam("deliverycounty", $data['deliverycounty']);
    
    $billingpostcode = getParam("billingpostcode", $data['billingpostcode']);
    $billingcity = getParam("billingcity", $data['billingcity']);
    $billingstreet = getParam("billingstreet", $data['billingstreet']);
    $billingcountry = getParam("billingcountry", $data['billingcountry']);
    $billingcounty = getParam("billingcounty", $data['billingcounty']);
       
    if (getParam("domodify", false) !== false) {
      
      $errors = array();
      $userId = userId();
      
      if ($lastname == "") { $errors[] = "Kérjük adja meg vezetéknevét!"; }        
      if ($forename == "") { $errors[] = "Kérjük adja meg keresztnevét!"; }
      if ($telephone == "") { $errors[] = "Kérjük adja meg telefonszámát!"; }
      if (!validEmail($email)) { $errors[] = "Kérjük helyes e-mail címet adjon meg!"; }      
            
      if ($billingpostcode == "") { $errors[] = "Kérjük adja meg a szállítási cím irányítószámát!"; } 
      if ($billingcity == "") { $errors[] = "Kérjük adja meg a szállítási cím város mezőjét!"; }
      if ($billingstreet == "") { $errors[] = "Kérjük adja meg a szállítási cím utca mezőjét!"; }
      
      if ($telephone == "") { $errors[] = "Kérjük adja meg telefonszámát!"; }
      
      if (($opassword != "") && ($password1 == "")) { 
//        $errors[] = "Kérjük adja meg új jelszavát!";
          $opassword="";
      }
      if ($password1 != $password2) { $errors[] = "A beírt jelszavaknak meg kell egyezniük!"; }
      
     
      if (sizeof($errors) == 0) {
        
        $emailExists = $db->GetRow("SELECT   COUNT(*) AS cnt
                                    FROM     " . TPX . "user
                                    WHERE    email=" . $db->qstr($email) . " AND
                                             id<>" . $db->qstr($userId) . "
                                    LIMIT    1
        ");
        if ($emailExists['cnt'] != 0) {
          $errors[] = "A megadott e-mail címmel már regisztráltak!";
        }  
        
        if ($opassword != "") {
          $row = $db->GetRow("SELECT * FROM " . TPX . "user WHERE id=" . $db->qstr($userId) . " LIMIT 1");
          if (!tep_validate_password($opassword, $row['password'])) {
            $errors[] = "Kérem helyesen adja meg régi jelszavát!";
          }
        } 
        
        if (sizeof($errors) == 0) {
        
          $sqlPlus = "";
          if ($opassword != "") {
            $sqlPlus = ", password = " . $db->qstr(tep_encrypt_password($password1));            
          }
        
          $db->Execute ("UPDATE   " . TPX . "user
                         SET      lastname          = " . $db->qstr($lastname) . ",
                                  forename          = " . $db->qstr($forename) . ",
                                  telephone         = " . $db->qstr($telephone) . ",
                                  fax               = " . $db->qstr($fax) . ",
                                  company           = " . $db->qstr($company) . ",
                                  gender            = " . $db->qstr($gender) . ", 
                                  email             = " . $db->qstr($email) . ",                                                                    
                                  deliverypostcode  = " . $db->qstr($deliverypostcode) . ",
                                  deliverycity      = " . $db->qstr($deliverycity) . ",
                                  deliverystreet    = " . $db->qstr($deliverystreet) . ",
                                  deliverycountry   = " . $db->qstr($deliverycountry) . ",
                                  deliverycounty    = " . $db->qstr($deliverycounty) . ",
                                  billingpostcode   = " . $db->qstr($billingpostcode) . ",
                                  billingcity       = " . $db->qstr($billingcity) . ",
                                  billingstreet     = " . $db->qstr($billingstreet) . ",
                                  billingcountry    = " . $db->qstr($billingcountry) . ",
                                  billingcounty     = " . $db->qstr($billingcounty) . "
                                  $sqlPlus
                         WHERE    id = " . $db->qstr($userId) . "
                         LIMIT    1
          ");          
          
          if ($_SESSION["hazater"]=="") {locationTo ($modifyFilename . "?modok=1");}
          if ($_SESSION["hazater"]!="") {$z=$_SESSION["hazater"]; $_SESSION["hazater"]=""; locationTo ($z);}
          
        }
      }
    }
    if (sizeof($errors) != 0) {
      $tpl->assign ("errors", $errors);        
    }
    
    $tpl->assign ("gender", $gender);
    $tpl->assign ("lastname", htmlspecialchars($lastname));
    $tpl->assign ("forename", htmlspecialchars($forename));
    $tpl->assign ("company", htmlspecialchars($company));
    $tpl->assign ("telephone", htmlspecialchars($telephone));
    $tpl->assign ("fax", htmlspecialchars($fax));
    $tpl->assign ("email", htmlspecialchars($email));    
        
    $tpl->assign ("deliverypostcode", htmlspecialchars($deliverypostcode));
    $tpl->assign ("deliverycity", htmlspecialchars($deliverycity));
    $tpl->assign ("deliverystreet", htmlspecialchars($deliverystreet));
    $tpl->assign ("deliverycountry", htmlspecialchars($deliverycountry));
    $tpl->assign ("deliverycounty", htmlspecialchars($deliverycounty));
    
    $tpl->assign ("billingpostcode", htmlspecialchars($billingpostcode));
    $tpl->assign ("billingcity", htmlspecialchars($billingcity));
    $tpl->assign ("billingstreet", htmlspecialchars($billingstreet));
    $tpl->assign ("billingcountry", htmlspecialchars($billingcountry));
    $tpl->assign ("billingcounty", htmlspecialchars($billingcounty));
        
    $template = "usermodify.tpl";
    
    break;
  // ----------------------------------------------------------------------------------------------------------
 
  // Szerkeszthető oldal megtekintése
  // ----------------------------------------------------------------------------------------------------------
  case "page":    
    if (!isset($item)) { locationTo ($mainFilename); }
    
    $data = $db->GetRow("SELECT    *
                         FROM      " . TPX . "page
                         WHERE     id=" . $db->qstr($item) . "
                         LIMIT     1
    ");                      
    $tpl->assign ("data", $data);
    
    $res = Sql("SELECT    *
                FROM      page_images
                WHERE     pageid = " . $db->qstr($item) . "
                ORDER BY  sort
    ");
    $images = array();
    if ($res->RecordCount() != 0) {
      while ($row = $res->FetchRow()) { $images[] = $row; }
    }                     
    $tpl->assign ("images", $images);
    
    $template = "page.tpl";
    $changeLanguage=-1;
  
    break;

  // Hírlevél
  // ----------------------------------------------------------------------------------------------------------
  case "hirlevel":
      
    $dod=$_POST['dod'];
    if ($dod=="feliratkoz") { 
      $_SESSION['vacakreg']=2;
      $hemail=$_POST['hirlemail'];
      $hnev=$_POST['hirlenev'];
      $msg="";
      if (!validEmail($hemail)) {
        $msg="Kérjük, érvényes email címet adjon meg!";
      }
      if ($msg=="")
      {
        //megnézzük fel van e iratkozva
        $sql="select nev,aktiv from hirlevel_users where email='$hemail'";
        $rr=$db->GetRow($sql);
        $tnev=$rr['nev'];
        $takt=$rr['aktiv'];
        $dat=date("Y.m.d H:i:s");
        if ($tnev=="") {
          // még nem regisztrált
          $sql="insert into hirlevel_users (nev,aktiv,email,regdate) values ('$hnev',1,'$hemail','$dat')";
          $db->Execute($sql);
          $msg = "Ön sikeresen feliratkozott hírlevelünkre!";
        }
      }
      if ($msg=="") {
        if ($tnev!="" && $takt==0) {
          //regisztrált, de most inaktív, újra feliratkozás
          $sql="update hirlevel_users set aktiv=1 where email='$hemail' LIMIT 1";
          $db->Execute($sql);
          $msg = "Ön újra aktiválta hírlevél igénylését!";
        }
        if ($tnev!="" && $takt==1) {
          //regisztrált, de most aktív, inaktiválás
          $sql="update hirlevel_users set aktiv=0 where email='$hemail' LIMIT 1";
          $db->Execute($sql);
          $msg = "Ön sikeresen leiratkozott hírlevelünkről!";
        }
      }

      $tpl->assign ("newslettermessage", $msg);
      $_SESSION['vacakuzi']=$msg;

      locationTo ($hirlevel);
    }

    $data = $db->GetRow("SELECT    *
                         FROM      " . TPX . "page
                         WHERE     id=11
                         LIMIT     1
    ");                      
    $tpl->assign ("data", $data['description']);                     
    
    $template = "hirlevel.tpl";
    $changeLanguage=-1;
  
    break;
  
  // ----------------------------------------------------------------------------------------------------------
  
  // Elfelejtett jelszó
  // ----------------------------------------------------------------------------------------------------------
  case "forgot":
    $template = "forgot.tpl";
    
    $msg = array();
    $email = getParam("forgot_email", "");
    
    if (getParam("doforgot", false) !== false) {
      $row = $db->GetRow("SELECT   *
                          FROM     " . TPX . "user
                          WHERE    email = " . $db->qstr($email) . "
                          LIMIT    1
      ");            
      if ($row != false) {
        $newPassword = randomString(8);
        $sqlPassword = tep_encrypt_password($newPassword);
        
        
        
        $mail = new TplMail();
      	$mail->SetVar ("password", $newPassword);
      	$mail->SetVar ("name", $row['lastname'] . " " . $row['forename']);
      	$mail->GetBody ("./mail/frontend-forgot.mail");
      	$mail->AddAddress ($row["email"]);
      	$mail->Subject = "Elfelejtett jelszó (" . DEFDOMAIN . ")";
      	$mail->Send();
      	
      	$db->Execute ("UPDATE  " . TPX . "user
                       SET     password = " . $db->qstr($sqlPassword) . "
                       WHERE   id = " . $db->qstr($row['id']) . "
                       LIMIT   1
        ");
        
        $jsMsg = "Új jelszavát kiküldtük e-mail címére!";
        
        $email = "";      	
      } 
      else {
        $msg[] = "Ismeretlen e-mail cím!";
      }                         
    }
    
    $tpl->assign ("errors", $msg);
    $tpl->assign ("email", htmlspecialchars($email));
    
    $template = "forgot.tpl";
  
  	break;
  // ----------------------------------------------------------------------------------------------------------
  
  // Termék megtekintése oldal
  // ----------------------------------------------------------------------------------------------------------
  case "products":
  
     $data = $db->GetRow("SELECT      p.*, m.title AS metatitle 
	                        FROM        " . TPX . "products AS p
                          INNER JOIN  " . TPX . "meta AS m
                          ON          p.metaid = m.id
            						  WHERE       p.id = " . $db->qstr($item) . "
            						  LIMIT       1
    ");
    if (!$data) { locationTo ($mainFilename); }
 
    $res = Sql("SELECT    *
                FROM      product_images
                WHERE     prodid = " . $db->qstr($item) . "
                ORDER BY  sort
    ");
    $images = array();
    if ($res->RecordCount() != 0) {
      while ($row = $res->FetchRow()) { $images[] = $row; }
    }
     $tpl->assign ("images", $images);
    $texts = $db->GetArray("SELECT      t.*
                            FROM        " . TPX . "texts_con_products AS tp
                            INNER JOIN  " . TPX . "texts AS t
                            ON          tp.textid = t.id
                            WHERE       tp.productid = " . $db->qstr($item) . "
    ");
   
    $tpl->assign ("texts", $texts);
    
    $productcounter = ((int)$data['productcounter'] + 1);
    $db->Execute ("UPDATE " . TPX . "products SET productcounter = $productcounter WHERE id=" . $db->qstr($item) . " LIMIT 1");
    
        
    $data["addToCartFilename"] = $basicCartFilename . "_" . URL_PARAM_ADDCART . "_" . $item;
    
    if (($data["image"] != "") && (file_exists("upload/products/{$data["image"]}"))) { $data["image"] = "upload/products/" . $data["image"]; $data["defaultimage"] = false; }
    else { $data["image"] = "images/nincs-kep.jpg"; $data["defaultimage"] = true; }
    if ($data["imgalt"] == "") { $data["imgalt"] = $data["metatitle"]; }
    if ($data["imgtitle"] == "") { $data["imgtitle"] = $data["metatitle"]; }
    $sql="select categoryid from ia_categories_con_products where productid=$item LIMIT 1";
    $ii=$db->GetRow($sql);
    $ii=$ii["categoryid"];
    $sql="select productid as id from ia_categories_con_products where categoryid=$ii and productid!=$item order by rand() LIMIT 2";
    $ii=$db->GetArray($sql);
   
    //két elem id
    $sql="select m.filename, p.instock, p.id, p.title, p.price, p.vat, p.description, p.image, p.imgalt, p.imgtitle from ia_meta as m, ia_products as p where m.id=p.metaid and p.id in (".$ii[0]['id'].", ".$ii[1]['id'].")";
    $ii=$db->GetArray($sql);
    if ($ii) {
      foreach ($ii as $k => $v) {
        $ii[$k]['description']=cropText($v['description'], 200, true);
        $ii[$k]['price'] = getPriceData($v["price"], $v['vat']);
        $ii[$k]['price']=number_format($ii[$k]['price'],0,"."," ");
        
        $editions = $db->GetOne("SELECT COUNT(*) FROM " . TPX . "product_editions WHERE productid=" . $v['id']);
        if ($editions == 0) {
          $ii[$k]['addToCartFilename'] = $basicCartFilename . "_" . URL_PARAM_ADDCART . "_" . $v["id"];
        }
        else {
          $ii[$k]['addToCartFilename'] = $v["filename"] . '.html'; 
        }          
      
      }
    }
  //lent a két termék...  
    //print_r($ii);
    $tpl->assign ("hasonlo", $ii); 
    $editions = $db->GetArray("SELECT   *
                               FROM     " . TPX . "product_editions
                               WHERE    productid = " . $db->qstr($item) . "
    ");
    foreach ($editions as $key => $value) {
      $editions[$key]["addToCartFilename"] = $data["addToCartFilename"] . "_" . $value["id"] . ".html";
      $editions[$key]["price"] = getPriceData($value["pricedifference"]+($data['priced']==0?$data['price']:$data['priced']), $data['vat']); 
    }
    
    $manufacturerData = $db->GetRow("SELECT     ma.title, ma.image, me.filename, ma.imgtitle, ma.imgalt
                                     FROM       " . TPX . "manufacturer AS ma 
                                     INNER JOIN " . TPX . "meta AS me
                                     ON         ma.metaid = me.id
                                     WHERE      ma.id=" . $db->qstr($data['manufacturer']) . " 
                                     LIMIT      1
    ");
    if (($manufacturerData["image"] != "") && (file_exists("upload/manufacturer/{$manufacturerData["image"]}"))) { $manufacturerData["image"] = "upload/manufacturer/" . $manufacturerData["image"]; }
    else { $manufacturerData["image"] = false; }
    
    $tpl->assign ("manufacturerData", $manufacturerData);
    
    
    $data['price'] = getPriceData($data['price'], $data['vat']);
    $data['priced'] = getPriceData($data['priced'], $data['vat']);
    
    
    // Kommentelés
    
	  $currentComments = $db->GetArray("SELECT    *
	                                    FROM      " . TPX . "comment
                  										WHERE     productid = " . $db->qstr($item) . "
                  										ORDER BY  comdate DESC
	  ");
	  
	  $class = "error";
	  
	  $comname = getParam("comname",  "");
	  if ($z1!="") {$comname=$z1;}
	  $comtext = getParam("comtext",  "");
	  $comemail = getParam("comemail",  "");
	  $try     = strtoupper(trim(getParam("checkbot", "")));
	  $rating  = (int)getParam("rating", "5");
	  if ($rating < 1) { $rating = 1; }
	  if ($rating > 5) { $rating = 5; }
	  
	  $msg = array();

	  if (getParam("postcomment", false) !== false) {

  		if (trim($comname) == "") { $msg[] = "Kérem adja meg nevét!"; }
  		if (trim($comtext) == "") { $msg[] = "Kérem írja le hozzászólását!"; }
		  if (trim($comemail)=="" && getParam("cikkcomment","")=="1") { $msg[] = "Kérem adja meg email címét!"; }
      if ($try != $_SESSION['captcha']) { $msg[] = "Kérem helyesen adja meg a képen látható kódot!"; }      		
  		
  		if (sizeof($msg) == 0) {
  		  $db->Execute("INSERT INTO   " . TPX . "comment
  		                VALUES        (NULL,
  		        				               " . $db->qstr($item) . ",
                									   " . htmlspecialchars($db->qstr($comname)) . ",
                									   " . htmlspecialchars($db->qstr($comtext)) . ",
                									   NOW(),
                									   " . $db->qstr(getIpAddress()) . ",
                									   " . $db->qstr($rating) . ",
                									   " . $db->qstr($metaid) . ",
                									   " . $db->qstr($comemail) . "
  									  ) 
  		  ");
  		    
  		  $mail = new TplMail();
      	$mail->SetVar ("fullname", $comname);      	       	      	
      	$mail->SetVar ("rating", $rating);
        $mail->SetVar ("message", $comtext);
        $mail->SetVar ("filename", $meta['filename']);      	        	
      	$mail->Subject = "Termék hozzászólás érkezett (" . DEFDOMAIN . " " . $data['title'] . ")";
      	$mail->GetBody ("./mail/comment-product.mail");
      	$mail->AddAddress (DEFAULT_EMAIL);
      	$mail->Send();
      	$mail->ClearAddresses();
      	$mail->AddAddress ("info@inteliart.hu");
      	$mail->Send();

  		  
  		  locationTo ($meta['filename'] . "_ok.html#comment");
  		}
    }
  
	  if ((array_key_exists(0, $rewriteParam)) && ($rewriteParam[0] == 'ok')) {
      $jsMsg = "Köszönjük hozzászólását!";
      //$class = "ok";
    }
	  
	  $tpl->assign ("currentComments", $currentComments);	  
	  $tpl->assign ("rstr", randomString(8));
	  $tpl->assign ("comname", htmlspecialchars($comname));
	  $tpl->assign ("comemail", htmlspecialchars($comemail));
	  $tpl->assign ("comtext", htmlspecialchars($comtext));
	  $tpl->assign ("rating", $rating);
	  
	  $tpl->assign ("class", $class);
	  $tpl->assign ("errors", $msg);
	  $tpl->assign ("formAction", $meta['filename'] . '.html');	  
	  
	  $_SESSION['captcha'] = strtoupper(randomString(5));
  	

    
    
    $data["addToCartFilename"] .= ".html";
    
    $tpl->assign ("editions", $editions);
	  $tpl->assign ("data", $data);
	  
	  $lastcat = false;
	  if (array_key_exists('lastcat', $_SESSION)) { $lastcat = (int)$_SESSION['lastcat']; }
	  // 1 véletlen kategória választása, ha nem kategórián keresztül jutottunk ide
	  if ($lastcat === false) {
	    $lastcat = $db->GetOne("SELECT    categoryid
	                            FROM      " . TPX . "categories_con_products
	                            WHERE     productid = " . $db->qstr($item) . "
	                            ORDER BY  RAND()
	                            LIMIT     1
	    ");
	  }
	  regenerateProductTree ($lastcat);
	  
	  
	  $template = "product.tpl";
    
    break;
  // ----------------------------------------------------------------------------------------------------------
  
  // Kosár
  // ----------------------------------------------------------------------------------------------------------	
case "cimsetup":
    $template = "cart_cim.tpl"; 
    $_SESSION["lp"] = $meta['filename'] . DEFEXT;
    break;  
case "fizsetup":
//fizetési mód ... ilyenis van ?
if ($_POST['vszm']!="") {$_SESSION['vszm']=$_POST['vszm'];}
$sql="select description from ia_page where id=2";
$sor=$db->GetRow($sql);
    $szam=$sor['description'];
    $tpl->assign ("fleiras", $szam);
    $pmx=$_SESSION["paymentmode"];
    if ($pmx=="") {$pmx=1;}
    
    $tpl->assign ("paymod", $pmx);
    
    // Megrendelési azonosító generálása
    $tmp = $db->GetRow("SELECT COUNT(*) AS cnt 
                        FROM   " . TPX . "orders 
                        WHERE  userid=" . $db->qstr(userId()) . "
    ");
    $tmp = (int)$tmp['cnt'] + 1;
    $noOfOrder = userId() . "/" . $tmp;
    $tpl->assign ("noOfOrder", $noOfOrder);
    
    $template = "cart_fizetes.tpl";  
    break;  


break;
case "szallsetup":
    $sql="select count(*) from delivery where aktiv=1";
    $sor=$db->GetRow($sql);
    $szam=$sor['count(*)'];
    $kiv=$_SESSION['vszm'];
	
    $sql="select id,title,ar,freefrom from delivery where aktiv=1 order by title";
    $szm=$db->GetArray($sql);
    $cc="";
	 $al1=""; $al2="még nem választott kiszállítást";
	$oo="atval[-1]='&nbsp;';\n";
	$aa="szmek[-1]='még nem választott kiszállítást';\n";
    for($x=0;$x<$szam;$x++)
      {
      $y=$szm[$x]['id'];
       $ingy=$szm[$x]['freefrom'];
      if ($ingy>0) { $oo.="atval[$y]='".number_format($ingy,0,"."," ")." Ft felett a szállítás költségét magunkra vállaljuk.';\n";}
      if ($ingy==0 || $ingy=="") { $oo.="atval[$y]='&nbsp;';\n";}
	$aa.="szmek[$y]='".number_format($szm[$x]['ar'],0,"."," ")." Ft';\n";
        $chk="";
		if ($kiv==$y) {
		 $chk='selected="selected"';
		 $al1="&nbsp;";
		 if ($ingy>0) { $al1=number_format($ingy,0,"."," ")." Ft felett a szállítás költségét magunkra vállaljuk.";}
		 $al2=number_format($szm[$x]['ar'],0,"."," ")." Ft";
		 }
       $cc.='<option '.$chk.' value="'.$y.'">'.$szm[$x]['title'].'</option>';
      }
    //print_r($szm);
       $tpl->assign ("cISO", $cISO);
    $tpl->assign ("szallok", $cc);
    $tpl->assign ("valtozok1", $aa);
	$tpl->assign ("al1", $al1);
	$tpl->assign ("al2", $al2);
	$tpl->assign ("vszm", $_SESSION['vszm']);
    $tpl->assign ("valtozok2", $oo);
    $template = "cart_szallitas.tpl";  
    break;  

  case "cart":

    $cartnow = array();
	  if (array_key_exists ('cart',$_SESSION)) {
      if ($_SESSION['cart']) {
        $cartnow = unserialize($cartnow = $_SESSION['cart']);
 	    }
	    if (!$cartnow) { $cartnow = array(); }
    }
    
    $cmd = "";
    if (array_key_exists(0, $rewriteParam)) { $cmd = $rewriteParam[0]; }
  
    // Termék hozzáadása kosárhoz
    if ($cmd == URL_PARAM_ADDCART) {
	  
  	  $productid = (int)$rewriteParam[1];
  	  if (array_key_exists(2, $rewriteParam)) { $editionid = (int)$rewriteParam[2]; }
  	  else { $editionid = "*"; }
	  
      $productData = $db->GetRow("SELECT      p.*, m.filename
                                  FROM        " . TPX . "products AS p
	 							                  INNER JOIN  " . TPX . "meta AS m
								                  ON          p.metaid = m.id
                                  WHERE       p.id = " . $db->qstr($productid) . " AND
								                              m.lang = " . $db->qstr($meta['lang']) . "
                                  LIMIT       1
      ");
      if ($editionid != "*") {
        $editionData = $db->GetRow("SELECT      e.*
                                     FROM        " . TPX . "product_editions AS e
                                     WHERE       e.id = " . $db->qstr($editionid) . " AND
  								                               e.productid = " . $db->qstr($productid) . "
                                     LIMIT       1
        ");
      }

      $quantity = 1;
	    if ($productData) {
	      $id = $productid."-".$editionid;
        if (isset($cartnow[$id])) { $cartnow[$id]['quantity'] += $quantity; }
	      else { $cartnow[$id]['quantity'] = $quantity; }
  		  updateCartItem(); // inc/func.php
      }

      $carttosend = serialize ($cartnow);
      $_SESSION['cart'] = $carttosend;     

      unset ($productData);
      unset ($id);
	 
	    locationTo ($cartFilename);
    } 

    // Darabszámok frissítése, esetleges review oldal megtekintésével
    if ((getParam("refresh", "0") !== "0") || (getParam("review", "0") !== "0")) {
      $newQuantities = getParam("basketQuantity", array());
	  
	    foreach ($newQuantities as $id => $quantity) {
  	    $quantity = floor((int)$quantity);
	      if ($quantity < 1) {
		      unset ($cartnow[$id]);
	      }
	      else {
    		  $cartnow[$id]['quantity'] = $quantity;        
		  
		      $tmp = explode("-", $id);
		      $productid = $tmp[0];
		      $editionid = $tmp[1];
		  
		      $productData = $db->GetRow("SELECT      p.*, m.filename
                                      FROM        " . TPX . "products AS p
			  	 				                    INNER JOIN  " . TPX . "meta AS m
								                      ON          p.metaid = m.id
                                      WHERE       p.id = " . $db->qstr($productid) . " AND
								                                  m.lang = " . $db->qstr($meta['lang']) . "
                                      LIMIT       1
          ");
          
          if ($editionid != "*") {
            $editionData = $db->GetRow("SELECT      e.*
                                        FROM        " . TPX . "product_editions AS e
                                        WHERE       e.id = " . $db->qstr($editionid) . " AND
  		    						                              e.productid = " . $db->qstr($productid) . "
                                        LIMIT       1
            ");
          }
		      if ($productData) { updateCartItem(); /* inc/func.php*/ }
	      }
	    }
	  
	    $carttosend = serialize ($cartnow);
      $_SESSION['cart'] = $carttosend;     
	  
	    if (getParam("review", "0") !== "0") {
	      if (userId() !== false) {
	        locationTo ($reviewFilename);
	      }
	      else {
          $_SESSION["lp"] = $reviewFilename;
          locationTo ($loginFilename);
       }
	    }
	    else {
  	    locationTo ($cartFilename);
  	  }
    }
    
    
    $template = "cart.tpl";  
    
    
  
    break;  
  // ----------------------------------------------------------------------------------------------------------  
  
  // Megrendelés áttekintése
  // ----------------------------------------------------------------------------------------------------------
  case "review":
    if ($_POST["paymentmode"]!="")
    {
        $paymentMode = getParam("paymentmode", "0");
        $_SESSION["paymentmode"]=$paymentMode;
    }
    
    $cartnow = array();
	  if (array_key_exists ('cart',$_SESSION)) {
      if ($_SESSION['cart']) {
        $cartnow = unserialize($cartnow = $_SESSION['cart']);
 	    }
	    if (!$cartnow) { $cartnow = array(); }
    }
    if ((userId() === false) || (sizeof($cartnow) == 0)) { locationTo ($cartFilename); }    
  
    $userInfo = $db->GetRow("SELECT   *
                             FROM     " . TPX . "user
                             WHERE    id = " . $db->qstr(userId()) . "
                             LIMIT    1
    ");
    
    $billingName = $userInfo['lastname'] . ' ' . $userInfo['forename'];
    $deliveryName = $billingName;
    if ($userInfo['company'] != '') { $billingName = $userInfo['company']; }
    
    $billingAddress = $billingName . "<br/> " . $userInfo['billingcountry'] . " " . $userInfo['billingpostcode'] . ' ' . 
                       $userInfo['billingcity'] . ($userInfo['billingcounty']==''?'':" ({$userInfo['billingcounty']})") . 
                       '<br/> ' . $userInfo['billingstreet'];
                       
                           
    $deliveryAddress = false;
    if (trim($userInfo['deliverypostcode']) != '') {
      $deliveryAddress = $deliveryName . "<br/> " . $userInfo['deliverycountry'] . " " . $userInfo['deliverypostcode'] . ' ' . 
                         $userInfo['deliverycity'] . ($userInfo['deliverycounty']==''?'':" ({$userInfo['deliverycounty']})") . 
                         '<br/> ' . $userInfo['deliverystreet'];
    }
    if (trim($_SESSION["tempcim"]) != '') {
      $deliveryAddress = $deliveryName . "<br/> " . $_SESSION["temporszag"] . " " . $_SESSION["tempirszam"] . ' ' . 
                         $_SESSION["tempvaros"] . '<br/> ' . $_SESSION["tempstreet"];
    }
    
    
    $fszolg="";
    $ingyensor="";
    if ($_SESSION['vszm']>0) {
      $sql="select title,ar,freefrom from delivery where id=".$_SESSION['vszm'];
          $sor=$db->GetRow($sql);
    $fszolg=$sor['title'];
    $freefrom=$sor['freefrom'];
    $ar=$sor['ar'];
    //if ($freefrom>0) {$ingyensor=number_format($freefrom,0,"."," ")." Ft felett ingyenes kiszállítás!";} else {
      $freefrom=99999999999999999999;
    
     }


    $tpl->assign ("fszolg", $fszolg);
    $tpl->assign ("paymod", $paymentModes[$_SESSION["paymentmode"]]);
    $tpl->assign ("ingyensor", $ingyensor);
    $tpl->assign ("szalldij", $ar);
    $tpl->assign ("ingyer", $freefrom);
    $tpl->assign ("deliveryAddress", $deliveryAddress);
    $tpl->assign ("billingAddress", $billingAddress);
    
    if (getParam("order", false) !== false) {
      $remark = getParam("remark", "");
      $paymentMode = $_SESSION["paymentmode"];    
      if (!array_key_exists($paymentMode, $paymentModes)) { locationTo ($reviewFilename); }
      
      
      $paymentMode = $paymentModes[$paymentMode];      
      $deliveryPrice = $defaultDeliveryPrice;
      
             
     
      $productDataArray = array();
      foreach (array_keys($cartnow) as $id) {
        $tmp = explode("-", $id);
        $productid = $tmp[0];
        $editionid = $tmp[1];
        
        $row = array();
        $row['productid'] = $productid;
        $row['editionid'] = $editionid;
        $row['quantity'] = $cartnow[$id]['quantity'];
        if ($editionid == "*") {
          $row['data'] = $db->GetRow("SELECT      p.*
                                      FROM        " . TPX . "products AS p                                      
                                      WHERE       p.id = " . $db->qstr($productid) . "
                                      LIMIT       1
          ");
        }
        else {
          $row['data'] = $db->GetRow("SELECT      p.*, e.title_1 AS editiontitle, e.pricedifference
                                      FROM        " . TPX . "product_editions AS e
                                      INNER JOIN  " . TPX . "products AS p
                                      ON          e.productid = p.id                                       
                                      WHERE       e.id = " . $db->qstr($editionid) . " AND
                                                  e.productid = " . $db->qstr($productid) . "
                                      LIMIT       1
          ");
        }
        
        $productDataArray[] = $row;
      }
      $dmode=$_SESSION['vszm'];
      $sql="select title from delivery where id=$dmode";
      $sor=$db->GetRow($sql);
      $dmode=$sor['title'];
      
      // Megrendelési azonosító generálása
      $tmp = $db->GetRow("SELECT COUNT(*) AS cnt 
                          FROM   " . TPX . "orders 
                          WHERE  userid=" . $db->qstr(userId()) . "
      ");
      $tmp = (int)$tmp['cnt'] + 1;
      $noOfOrder = userId() . "/" . $tmp;
      
      
      if ($_SESSION["tempcim"]!="")
      {
        $db->Execute ("INSERT INTO " . TPX . "orders
                     VALUES      (NULL,                                  
                                  " . $db->qstr(userId()). ",
                                  0,
                                  " . $db->qstr($userInfo['lastname']) . ",
                                  " . $db->qstr($userInfo['forename']) . ",
                                  " . $db->qstr($userInfo['email']) . ",
                                  " . $db->qstr($userInfo['telephone']) . ",
                                  " . $db->qstr($userInfo['fax']) . ",
                                  " . $db->qstr($userInfo['company']) . ",                                  
                                  " . $db->qstr($userInfo['billingpostcode']) . ",
                                  " . $db->qstr($userInfo['billingcity']) . ",
                                  " . $db->qstr($userInfo['billingstreet']) . ",
                                  " . $db->qstr($userInfo['billingcountry']) . ",                                  
                                  " . $db->qstr($userInfo['billingcounty']) . ",
                                  " . $db->qstr($_SESSION["tempirszam"]) . ",
                                  " . $db->qstr($_SESSION["tempvaros"]) . ",
                                  " . $db->qstr($_SESSION["tempstreet"]) . ",
                                  " . $db->qstr($_SESSION["temporszag"]) . ",
                                  " . $db->qstr("N/A") . ",
                                  " . $db->qstr(htmlspecialchars($remark)) . ",
                                  " . $db->qstr('0') . ",
                                  NOW(),
                                  " . $db->qstr($paymentMode) . ",
                                  " . $db->qstr($deliveryPrice) . ",
				  '" . $dmode . "',
          " . $db->qstr($noOfOrder) . "   
                                 )
      ");
        } else {
      $db->Execute ("INSERT INTO " . TPX . "orders
                     VALUES      (NULL,                                  
                                  " . $db->qstr(userId()). ",
                                  0,
                                  " . $db->qstr($userInfo['lastname']) . ",
                                  " . $db->qstr($userInfo['forename']) . ",
                                  " . $db->qstr($userInfo['email']) . ",
                                  " . $db->qstr($userInfo['telephone']) . ",
                                  " . $db->qstr($userInfo['fax']) . ",
                                  " . $db->qstr($userInfo['company']) . ",                                  
                                  " . $db->qstr($userInfo['billingpostcode']) . ",
                                  " . $db->qstr($userInfo['billingcity']) . ",
                                  " . $db->qstr($userInfo['billingstreet']) . ",
                                  " . $db->qstr($userInfo['billingcountry']) . ",                                  
                                  " . $db->qstr($userInfo['billingcounty']) . ",
                                  " . $db->qstr($userInfo['deliverypostcode']) . ",
                                  " . $db->qstr($userInfo['deliverycity']) . ",
                                  " . $db->qstr($userInfo['deliverystreet']) . ",
                                  " . $db->qstr($userInfo['deliverycountry']) . ",
                                  " . $db->qstr($userInfo['deliverycounty']) . ",
                                  " . $db->qstr(htmlspecialchars($remark)) . ",
                                  " . $db->qstr('0') . ",
                                  NOW(),
                                  " . $db->qstr($paymentMode) . ",
                                  " . $db->qstr($deliveryPrice) . ",
				  '" . $dmode . "',
          " . $db->qstr($noOfOrder) . "   
                                 )
      ");
      }
      $lastTmp = $db->GetRow ("SELECT LAST_INSERT_ID() AS cnt");
      $lastId = $lastTmp['cnt'];
      
      $totalSum = 0;
      $emailProductList = "";
      foreach ($productDataArray as $key => $value) {
        $price = decidePrice($value["data"]["price"], $value["data"]["priced"]);
        $title = $value["data"]["title"];
        
        if ($value["editionid"] != "*") { 
          $price += $value["data"]["pricedifference"];
          $title .= " (" . $value["data"]["editiontitle"] . ")"; 
          //$title .= "<i> - " . $value["data"]["editiontitle"] . "</i>"; 
        }
        
        $sum = getPriceData($price, $value["data"]["vat"], $value["quantity"]);
        
        $productid = $value["productid"];
        $editionid = (int)$value["editionid"];
        
        $db->Execute ("INSERT INTO " . TPX . "ordereditem
                       VALUES      (NULL,
                                    $lastId,
                                    $productid,
                                    $editionid,
                                    " . $db->qstr($title) . ",
                                    {$value['quantity']},
                                    " . $db->qstr(getPriceData($price, $value["data"]["vat"])) . ",
                                    " . $db->qstr($value["data"]["vat"]) . ",
                                    " . $db->qstr(getVatData($price, $value["data"]["vat"], $value['quantity'])) . ",
                                    " . $db->qstr((int)($price * $value['quantity'])) . ",
                                    " . $db->qstr((int)$sum) . "
                                   )
        ");   
        
        $totalSum += $sum;
        
        $emailProductList .= $value['quantity'] . " db " . $title . ", $sum Ft\n";
      }
      if ($totalSum >= $freeDeliveryLimit) { $deliveryPrice = 0; }
            
      $mail = new TplMail();
      $mail->SetVar ("productList", $emailProductList);
      $mail->SetVar ("deliveryPrice", $deliveryPrice);
      $mail->SetVar ("totalSum", $totalSum + $deliveryPrice);      
      $mail->SetVar ("fullname", $userInfo['lastname'] . " " . $userInfo['forename']);
      $mail->GetBody ("./mail/order-customer.mail");
      $mail->AddAddress ($userInfo["email"]);
      $mail->Subject = "Megrendelés visszaigazolása (" . DEFDOMAIN . ")";
      $mail->Send();

      $mail = new TplMail();
      $mail->SetVar ("totalSum", $totalSum);
      $mail->SetVar ("productList", $emailProductList);
      $mail->Subject = "Megrendelés érkezett az " . DEFDOMAIN . " oldalról";
      $mail->GetBody ("./mail/order-admin.mail");
      $mail->AddAddress (DEFAULT_EMAIL);
      $mail->Send();
      $mail->ClearAddresses();
      $mail->AddAddress ("info@inteliart.hu");
      $mail->Send();  	      
      
      $db->Execute ("UPDATE " . TPX . "orders
                     SET    totalsum      = " . $db->qstr($totalSum) . ",
                            deliveryprice = " . $db->qstr($deliveryPrice) . "
                     WHERE  id = " . $db->qstr($lastId) . "
                     LIMIT  1
      ");                     
      
      unset ($_SESSION['cart']);      
      locationTo ($pgThankYouFilename);
    }
    
    $template = "review.tpl";
  
    break;
  
  
  // Kapcsolatfelvétel oldal
  // ----------------------------------------------------------------------------------------------------------
  case "contact":
    $formAction = $contactFilename;
    
    $fullname = trim(getParam("fullname", ""));    
    $email = trim(getParam("email", ""));
    $telephone = trim(getParam("telephone", ""));
    $message = htmlspecialchars(trim(getParam("message", "")));
    $try     = strtoupper(trim(getParam("checkbot", "")));
    
    $msg = array();   
    
    if (getParam("docontact", false) !== false) {
      $ok = true;            
      if (!validEmail($email)) { $msg[] = "Kérem helyes e-mail címet adjon meg!"; $ok = false; }      
      if ($message == "") { $msg[] = "Kérem írja le üzenetét!"; $ok = false; }
      if ($try != $_SESSION['captcha']) { $msg[] = "Kérem helyesen adja meg a képen látható kódot!"; $ok=false; }
    
      if ($ok) {
      	$mail = new TplMail();
      	$mail->SetVar ("fullname", $fullname);      	
      	$mail->SetVar ("email", $email);      	
      	$mail->SetVar ("telephone", $telephone);
      	$mail->SetVar ("message", $message);
      	$mail->Subject = "Kapcsolatfelvételi űrlap érkezett";
      	$mail->GetBody ("./mail/contact.mail");
      	$mail->AddAddress (DEFAULT_EMAIL);
        $mail->Send();  	
        $mail->ClearAddresses();
        $mail->AddAddress ("info@inteliart.hu");
        $mail->Send();
        
        $db->Execute ("INSERT INTO " . TPX . "contacts
                       VALUES      (NULL,                                    
                                    NOW(),
                                    " . $db->qstr($fullname) . ",
                                    " . $db->qstr($email) . ",
                                    " . $db->qstr($message) . ",
                                    " . $db->qstr($telephone) . "
                                   )
        ");                                           
        
      	locationTo ("$contactFilename?contactok=1");        	
      }      
    }
    if (getParam("contactok", false) !== false) {
      $jsMsg = "Köszönjük, üzenetét megkaptuk!";
    }  
    $tpl->assign ("rstx", randomString(16));
    $tpl->assign ("fullname", htmlspecialchars($fullname));    
    $tpl->assign ("email", htmlspecialchars($email));                       
    $tpl->assign ("telephone", htmlspecialchars($telephone));
    $tpl->assign ("message", htmlspecialchars($message));    
    $tpl->assign ("errors", $msg);
    $_SESSION['captcha'] = strtoupper(randomString(5));
    $template = "contact.tpl";    
  
    break;
  
  // ----------------------------------------------------------------------------------------------------------

  // Hírek listája
  // ----------------------------------------------------------------------------------------------------------
  case "articlelist":
    $step = ARTICLE_PER_PAGE;
    $pg = 0;
    if (array_key_exists(0, $rewriteParam)) { $pg = (int)$rewriteParam[0]; }
    
    cookieSet("apg", $pg);
    
    $articles = $db->GetArray("SELECT SQL_CALC_FOUND_ROWS a.title, a.intro, a.image, a.artdate, a.imgtitle, a.imgalt, a.morelink, a.moretitle,  
                                                          m.filename, m.title AS metatitle
                               FROM                       " . TPX . "article AS a
                               INNER JOIN                 " . TPX . "meta AS m
                               ON                         a.metaid = m.id
                               WHERE                      m.lang = " . $db->qstr($meta['lang']) . " AND
                                                          a.public = " . $db->qstr('1') . "    
                               ORDER BY                   a.artdate DESC
                               LIMIT                      " . $pg * $step . ", " . $step . "
    ");
    
    foreach ($articles as $key => $value) {
      //$articles[$key]["artdate"] = formatDate($value["artdate"]);
      if (($value["image"] != "") && (file_exists("upload/articles/{$value["image"]}"))) { $articles[$key]["image"] = "upload/articles/" . $value["image"]; }
      else { $articles[$key]["image"] = false; }      
      
      if ($value["imgalt"] == "") { $articles[$key]["imgalt"] = $value["metatitle"]; }
      if ($value["imgtitle"] == "") { $articles[$key]["imgtitle"] = $value["metatitle"]; }
      
      $articles[$key]["intro"] = cropText ($articles[$key]["intro"], 200);
      
    }
    
    $tpl->assign ("articles", $articles);    
    
    $totalTmp = $db->GetRow("SELECT FOUND_ROWS() AS cnt;");
    $total = $totalTmp['cnt'];
    
    $baseFn = $meta['filename'];    
    $prev = true; $prevPage = false;
    $next = true; $nextPage = false;
    
    
    if ($pg == 0) { $prev = false; } 
    else { $prevPage = $pg-1; }
    if ($total <= (($pg+1)*$step)) { $next = false; }
    else { $nextPage = $pg+1; }
    
    $nextPage = $baseFn . "_" . formatPage($nextPage) . ".html";
    if ($prevPage != 0) { $prevPage = $baseFn . "_" . formatPage($prevPage) . ".html"; }
    else { $prevPage = $baseFn . ".html"; }
        
    $pages = array();
    for ($i=0;$i<=floor(($total-1)/$step);$i++) {
      $row['filename'] = $baseFn . "_" . formatPage($i) . ".html";
      if ($i==0) { $row['filename'] = $baseFn . ".html"; }
      
      $row['current'] = false; 
      if ($i==$pg) { $row['current'] = true; }
      
      $row['caption'] = $i+1;
      
      $pages[] = $row; 
    }

    $tpl->assign ("total", $total);    
    $tpl->assign ("next", $next);
    $tpl->assign ("prev", $prev);
    $tpl->assign ("prevPage", $prevPage);
    $tpl->assign ("nextPage", $nextPage);    
    $tpl->assign ("pages", $pages);
    
    $template = "articlelist.tpl";     
  
  	break;
  // ----------------------------------------------------------------------------------------------------------
    
  // Hír megtekintése
  // ----------------------------------------------------------------------------------------------------------
  case "article":    
  case "articles":
if (!isset($item)) { locationTo ("/"); }
    
    $res = Sql("SELECT      a.*, m.title AS metatitle
                FROM        ia_article AS a
                INNER JOIN  ia_meta AS m
                ON          a.metaid = m.id
                WHERE       a.id=" . $db->qstr($item) . " AND
                            a.public=" . $db->qstr('1') . "
                LIMIT       1
    ");
    $data = $res->FetchRow(); 
    $data["artdate"] = formatDate($data["artdate"]);
    
    if (($data["image"] != "") && (file_exists("upload/articles/{$data["image"]}"))) { $data["image"] = "upload/articles/" . $data["image"]; }
    else { $data["image"] = false; }      
    
    if ($data["imgalt"] == "") { $data["imgalt"] = $data["metatitle"]; }
    if ($data["imgtitle"] == "") { $data["imgtitle"] = $data["metatitle"]; }
    
     
    
    $res = Sql("SELECT    *
                FROM      article_images
                WHERE     artid = " . $db->qstr($item) . "
                ORDER BY  sort
    ");
    $images = array();
    if ($res->RecordCount() != 0) {
      while ($row = $res->FetchRow()) { $images[] = $row; }
    }                                     
    
  /*  $res = Sql("SELECT      n.*, m.filename
                FROM        articles_con_categories AS a
                INNER JOIN  meta AS m
                ON          n.metaid = m.id
                WHERE       artid = " . $db->qstr($item) . "
                ORDER BY    sort
    ");*/
    $categories = array();
 /*   if ($res->RecordCount() != 0) {
      while ($row = $res->FetchRow()) { $categories[] = $row; }
    }*/
    
    
    $similarArticles = array();
    $first = true; $sqlCatWhere = ""; 
    foreach ($categories as $cat) {
      if (!$first) { $sqlCatWhere .= ","; } 
      $sqlCatWhere .= $cat['id'];
      $first = false; 
    }
    if ($sqlCatWhere != "") {
   /*   $res = Sql("SELECT      a.id, a.title, m.filename, COUNT(a.id) AS tagno
                  FROM        articles_con_categories AS x
                  INNER JOIN  articles AS a 
                  ON          x.artid = a.id AND
                              x.catid IN ($sqlCatWhere) 
                  INNER JOIN  meta AS m 
                  ON          a.metaid = m.id
                  INNER JOIN  newscat AS n 
                  ON          x.catid = n.id
                  WHERE       a.id <> " . $db->qstr($item) . "
                  GROUP BY    a.id
                  ORDER BY    tagno DESC, title ASC
      ");
                                                              */
      $res = Sql("SELECT      a.id, a.title, m.filename, COUNT(a.id) AS tagno
                  FROM        ia_article AS a 
                  INNER JOIN  ia_meta AS m 
                  ON          a.metaid = m.id
                  WHERE       a.id <> " . $db->qstr($item) . "
                  GROUP BY    a.id
                  ORDER BY    tagno DESC, title ASC
      ");
      while ($row = $res->FetchRow()) { $similarArticles[] = $row; }
    }
    
     $sql="select i.tagid, t.content from tag_to_content i, tags t where i.tagid=t.id and i.contentid=" . $data['metaid'];
//echo $sql;
$zum=0;
     $res=Sql($sql);
     while ($row=$res->FetchRow())
      {
	$zum++;
	//ezek a saját címszavaim... közben ki is kell majd írni őket
	$cimszavak[$zum]['title']=$row['content'];
	$cimszavak[$zum]['id']=$row['tagid'];

	if ($kulcs=="") {$kulcs=$row['tagid'];} else {$kulcs.=", ".$row['tagid'];}

      }
      if ($kulcs!="")
{
      $sql="select distinct contentid from tag_to_content where tagid in (".$kulcs.") and contentid<>".$data['metaid'];
      $res=Sql($sql);
      $num=0;
      while ($row=$res->FetchRow())
      {
	
	$mmetaid=$row['contentid'];
	$sql="select a.title, m.filename from ia_article a, ia_meta m where a.metaid=m.id and a.metaid=$mmetaid and a.public=1 LIMIT 1";
	$rr=$db->GetRow($sql);
	if ($rr['title']!="")
	{
	$num++;
	if ($num<6) {$similarArticles[]=$rr;}
	}
      }

      $sql="select a.id, a.title, m.filename from ia_article a, ia_meta m where a.metaid=m.id and a.id<>". $db->qstr($item) . " and " . $cimkeres . " order by a.artdate limit 5";
}

    /*$lastPage = cookieGet("apg", 0);
    $backFilename = $articlesFilename;
    if ($lastPage != 0) { $backFilename = str_replace(DEFEXT, "_$lastPage" . DEFEXT, $backFilename); }*/


    $tpl->assign ("similarArticles", $similarArticles);                         
    $tpl->assign ("cimkek", $cimszavak);
    $tpl->assign ("rstr", randomString(8)); 
    $tpl->assign ("data", $data);    
    $tpl->assign ("images", $images);
    $tpl->assign ("authorData", $authorData);
    $tpl->assign ("categories", $categories);
    $metaid=$meta['id']	;
    //$tpl->assign ("backFilename", $backFilename);
    if ($data["comments"] == '1') {
      $sql="SELECT * FROM ia_comment WHERE metaid = " . $db->qstr($meta['id']) . " ORDER BY comdate DESC";
      
      $result = Sql($sql);
    
      $currentComments = array();
      while ($row = $result->FetchRow()) {
        //$tmp = explode(" ", $row["comdate"]);
        //$row["comdate"] = formatDate($tmp[0]) . " " . $tmp[1];
        $currentComments[] = $row;         
      }
      
      $tpl->assign ("currentComments", $currentComments);
      $tpl->assign ("totalComment", $result->RecordCount()); 

      
      if (userId() !== false) {
        //$userData = $db->GetRow("SELECT * FROM users WHERE id=" . $db->qstr(userId()) . " LIMIT 1");
        $userData = getUserData(userId());
        $tpl->assign ("userName", $userData['username']);      
        $tpl->assign ("commDate", date("Y.m.d"));
        $commentType = COMMENT_TYPE_ARTICLE; 
       
      }
      $metaid = $data['metaid'];
	include ('comment.php'); 
    }
    
   if (($data['registeredonly'] == 1) && (userId() === false)) { $tpl->assign ("tartalom", "articleview-register.tpl"); }
    else {  $tpl->assign ("tartalom", "articleview.tpl"); }
          $template = "belsokeret.tpl";
          
          
          
    $lastPage = cookieGet("apg", 0);
    $backFilename = $articleListFilename;
    if ($lastPage != 0) { $backFilename = str_replace(".html", "_" . formatPage($lastPage) . ".html", $backFilename); }
    $tpl->assign ("backFilename", $backFilename);

          
          
    break;
/*
    if (!isset($item)) { locationTo ("/"); }
      
    $data = $db->GetRow("SELECT      a.*, m.title AS metatitle
                         FROM        " . TPX . "article AS a
                         INNER JOIN  " . TPX . "meta AS m
                         ON          a.metaid = m.id
                         WHERE       a.id=" . $db->qstr($item) . "
                         LIMIT       1
    ");        
    $data["artdate"] = formatDate($data["artdate"]);
    
    if (($data["image"] != "") && (file_exists("upload/articles/{$data["image"]}"))) { $data["image"] = "upload/articles/" . $data["image"]; }
    else { $data["image"] = false; }
    
    if ($data["imgalt"] == "") { $data["imgalt"] = $data["metatitle"]; }
    if ($data["imgtitle"] == "") { $data["imgtitle"] = $data["metatitle"]; }
    
    $lastPage = cookieGet("apg", 0);
    $backFilename = $articleListFilename;
    if ($lastPage != 0) { $backFilename = str_replace(".html", "_" . formatPage($lastPage) . ".html", $backFilename); }
                             
    $tpl->assign ("data", $data);    
    $tpl->assign ("backFilename", $backFilename);

    $template = "articleview.tpl";
  
    break;
  */
  // ----------------------------------------------------------------------------------------------------------
  
  // Gyártó adatlapjának megtekintése
  // ----------------------------------------------------------------------------------------------------------
  case "manufacturer":    
    if (!isset($item)) { locationTo ("/"); }
      
    $data = $db->GetRow("SELECT      ma.*, me1.title AS metatitle, me2.filename
                         FROM        " . TPX . "manufacturer AS ma
                         INNER JOIN  " . TPX . "meta AS me1
                         ON          ma.metaid = me1.id
                         INNER JOIN  " . TPX . "meta AS me2
                         ON          ma.`metaid-list` = me2.id
                         WHERE       ma.id=" . $db->qstr($item) . "
                         LIMIT       1
    ");        
        
    if (($data["image"] != "") && (file_exists("upload/manufacturer/{$data["image"]}"))) { $data["image"] = "upload/manufacturer/" . $data["image"]; }
    else { $data["image"] = false; }
    
    if ($data["imgalt"] == "") { $data["imgalt"] = $data["metatitle"]; }
    if ($data["imgtitle"] == "") { $data["imgtitle"] = $data["metatitle"]; }
                             
    $tpl->assign ("data", $data);    
    
    $template = "manufacturerview.tpl";
  
    break;
  
  // ----------------------------------------------------------------------------------------------------------
  
  // Felhasználói központ
  // ----------------------------------------------------------------------------------------------------------
  case "usercenter":
  
    if (userId() === false) { locationTo ($mainFilename); }
  
    $template = "usercenter.tpl";
    break;
  // ----------------------------------------------------------------------------------------------------------
  
  // Korábbi megrendelések
  // ----------------------------------------------------------------------------------------------------------
  case "previousorders":
  
    $userId = userId();
    if ($userId === false) { locationTo ($mainFilename); }    
      
    if (array_key_exists(0, $rewriteParam)) { $orderId = (int)$rewriteParam[0]; }
   
    if (!isset($orderId)) {
      $orders = $db->GetArray("SELECT    *
                               FROM      " . TPX . "orders
                               WHERE     userid = " . $db->qstr($userId) . "
                               ORDER BY  arrived DESC
      ");
      foreach ($orders as $key => $value) {
        $orders[$key]['filename'] = str_replace('.html', '_' . $value['id'] . '.html', $previousordersFilename);
      }
      $tpl->assign ("orders", $orders);
      
      $template = "previousorders-list.tpl";
    }
    else {
      $orders = $db->GetRow("SELECT   *
                             FROM     " . TPX . "orders
                             WHERE    id = " . $db->qstr($orderId) . " AND
                                      userid = " . $db->qstr($userId) . "
                             LIMIT    1
      ");      
      if (sizeof($orders) == 0) { locationTo($previousordersFilename); }
      
      $orderedItem = $db->GetArray("SELECT   *
                                    FROM     " . TPX . "ordereditem
                                    WHERE    orderid = " . $db->qstr($orderId) . "
      ");
      
      if ($orders['deliverystreet'] == '') {
        $orders['deliverypostcode'] = $order['billingpostcode'];
        $orders['deliverycity'] = $order['billingcity'];
        $orders['deliverycounty'] = $order['billingcounty'];
        $orders['deliverycountry'] = $order['billingcountry'];
        $orders['deliverystreet'] = $order['billingstreet'];
      }

      $tpl->assign ("orders", $orders);
      $tpl->assign ("orderedItem", $orderedItem);
                    
      $template = "previousorders-view.tpl";
    }
    break;
  
  // ----------------------------------------------------------------------------------------------------------
  
  // Gyártók listája
  // ----------------------------------------------------------------------------------------------------------
  case "manufacturerlist":
    $data = $db->GetArray("SELECT      ma.*, me.filename
                           FROM        " . TPX . "manufacturer AS ma
                           INNER JOIN  " . TPX . "meta AS me
                           ON          ma.`metaid-list` = me.id
                           WHERE       me.lang=" . $db->qstr($meta['lang']) . "
                           ORDER BY    ma.title  
    ");               
    foreach ($data as $key => $value) {
      $data[$key]["title"] = trim($value["title"]);
      $data[$key]["letter"] = substr($value["title"], 0, 1);
    }
    
    $tpl->assign ("data", $data);
    
    $template = "manufacturerlist.tpl";
  
    break;  
  // ----------------------------------------------------------------------------------------------------------
  
  // Keresés
  // ----------------------------------------------------------------------------------------------------------
  case "search";
  
    
                          
    $template = "search.tpl";
  
    break;
  // ----------------------------------------------------------------------------------------------------------
  
  // Termék listázások...
  // ----------------------------------------------------------------------------------------------------------  
  case "manufacturer-list":
  case "productgroup":
  case "searchresults":
  case "discount":
  case "category":
  
    // ...kategória alapján
    // ----------------------------------------------------------------------------------------------------------
    if ($mod == "category") {
      $joinSql = "INNER JOIN " . TPX . "categories_con_products AS x ON p.id=x.productid";
      $whereSql = "WHERE x.categoryid=" . $db->qstr($item);
      $_SESSION['lastcat'] = $item;
      regenerateProductTree ($item);
    }// ----------------------------------------------------------------------------------------------------------  
    
  
    // ...gyártó alapján
    // ----------------------------------------------------------------------------------------------------------
    if ($mod == "manufacturer-list") {
      $joinSql = "";
      $whereSql = "WHERE p.manufacturer = " . $db->qstr($item);
      unset ($_SESSION['lastcat']);
    }// ----------------------------------------------------------------------------------------------------------  
    
    // ...akciós termékek
    // ----------------------------------------------------------------------------------------------------------
    if ($mod == "discount") {
      $joinSql = "";
      
      $whereSql = "WHERE p.gender='on' or p.gender='1' ";
      unset ($_SESSION['lastcat']);
    }// ----------------------------------------------------------------------------------------------------------  
    
    // ...kategória alapján
    // ----------------------------------------------------------------------------------------------------------
    if ($mod == "productgroup") {
      $joinSql = "INNER JOIN " . TPX . "categories_con_products AS x ON p.id=x.productid";
      $whereSql = "WHERE x.categoryid=" . $db->qstr($item);
      unset ($_SESSION['lastcat']);
    }
    // ----------------------------------------------------------------------------------------------------------  
    // ...keresés alapján
    // ----------------------------------------------------------------------------------------------------------
    if ($mod == "searchresults") { 
      unset ($_SESSION['lastcat']);     
      if (getParam("dosearch", false) !== false) {
        unset ($_SESSION['minprice']);
        unset ($_SESSION['maxprice']);
        unset ($_SESSION['manufacturer']);
        unset ($_SESSION['categories']);
        unset ($_SESSION['genderfilter']);
      
        $searchPattern = str_replace(array('%', "'") ,array('',''), trim(getParam("searchpattern", "")));
        
        if ($searchPattern=="Megnevezés") {$searchPattern="";}
        
        $_SESSION['lastsearch'] = $searchPattern;
        //echo $searchPattern;
        
        $minPrice = (int)getParam("minprice", 0);
        $_SESSION['minprice'] = $minPrice;
        
        $maxPrice = (int)getParam("maxprice", 0);
        $_SESSION['maxprice'] = $maxPrice;
        
        $manufacturer = getParam("manufacturer", "*");
        $_SESSION['manufacturer'] = $manufacturer;
        
        $categories = getParam("categories", array());
        if ($categories[0]=="*") {$categories=array();}
        $_SESSION['categories'] = serialize($categories);
        
        $genderFilter = getParam("genderfilter", array());
        $_SESSION['genderfilter'] = serialize($genderFilter);        
      } 
      else {
        if (array_key_exists('lastsearch', $_SESSION)) { $searchPattern = $_SESSION ['lastsearch']; }
        else { $searchPattern = ''; }
        
         if (array_key_exists('minprice', $_SESSION)) { $minPrice = $_SESSION ['minprice']; }
         else { $minPrice = 0; }
         
         if (array_key_exists('maxprice', $_SESSION)) { $maxPrice = $_SESSION ['maxprice']; }
         else { $maxPrice = 0; }
         
         if (array_key_exists('manufacturer', $_SESSION)) { $manufacturer = $_SESSION ['manufacturer']; }
         else { $manufacturer = "*"; }
         
         if (array_key_exists('categories', $_SESSION)) { $categories = unserialize($_SESSION ['categories']); }
         else { $categories = array(); }
         
         if (array_key_exists('genderfilter', $_SESSION)) { $genderFilter = unserialize($_SESSION ['genderfilter']); }
         else { $genderFilter = array(); }
      }
      $joinSql = "";
      
      $whereSql = "";
      if (strlen($searchPattern) != 0) {
        $searchPattern = $db->qstr('%' . $searchPattern . '%');
        if (strlen($whereSql) == 0) { $whereSql .= " WHERE "; } else { $whereSql .= " AND "; }
        $whereSql .= " (p.title LIKE $searchPattern or p.description LIKE $searchPattern)";
      }
      if ($minPrice != 0) {
        if (strlen($whereSql) == 0) { $whereSql .= " WHERE "; } else { $whereSql .= " AND "; }
        $whereSql .= " (p.price*(1+(p.vat/100)) >= $minPrice)";
      }
      if ($maxPrice != 0) {
        if (strlen($whereSql) == 0) { $whereSql .= " WHERE "; } else { $whereSql .= " AND "; }
        $whereSql .= " (p.price*(1+(p.vat/100)) <= $maxPrice)";
      }
      if ($manufacturer != "*") {
        if (strlen($whereSql) == 0) { $whereSql .= " WHERE "; } else { $whereSql .= " AND "; }
        $whereSql .= " (p.manufacturer = " . $db->qstr($manufacturer) . ")";
      }
      if (sizeof($categories) != 0) {
        $check = array();
        foreach ($categories as $tmp) { $check[] = $db->qstr((int)$tmp); }
        
        
        $joinSql = "INNER JOIN " . TPX . "categories_con_products AS x ON p.id=x.productid";
        
        if (strlen($whereSql) == 0) { $whereSql .= " WHERE "; } else { $whereSql .= " AND "; }
        $whereSql .= " (x.categoryid IN (" . implode(",", $check) . "))";
        unset ($check);
      }
      
      if ((sizeof($genderFilter) != 0) && (sizeof($genderFilter) != 3)) {
        $check = array();
        foreach ($genderFilter as $tmp) { $check[] = $db->qstr($tmp); }
        
        if (strlen($whereSql) == 0) { $whereSql .= " WHERE "; } else { $whereSql .= " AND "; }
        $whereSql .= " (p.gender IN (" . implode(",", $check) . "))";
        unset ($check);
      }
      
    }
    // ----------------------------------------------------------------------------------------------------------  
  
  
    $baseFn = $meta['filename'];
      
    $pg = 0;
    $orderBy = "p.title ASC"; $titleOrderLink=$baseFn."_0" . TITLE_DESC_MARKER . ".html"; $priceOrderLink=$baseFn."_0" . PRICE_ASC_MARKER . ".html";
    $lastChar = "";
    if (array_key_exists(0, $rewriteParam)) { 
      $pg = (int)$rewriteParam[0];      
      // Listázás irányának meghatározása
      if ((string)$pg != $rewriteParam[0]) {
        $lastChar = substr($rewriteParam[0], strlen($rewriteParam[0])-1, 1);
        switch ($lastChar) {
          case TITLE_DESC_MARKER: $orderBy = "p.title DESC";          $titleOrderLink=$baseFn.".html"; $priceOrderLink=$baseFn."_0" . PRICE_ASC_MARKER . ".html"; break;
          case PRICE_ASC_MARKER:  $orderBy = "p.price ASC, p.title";  $titleOrderLink=$baseFn.".html"; $priceOrderLink=$baseFn."_0" . PRICE_DESC_MARKER . ".html"; break;
          case PRICE_DESC_MARKER: $orderBy = "p.price DESC, p.title"; $titleOrderLink=$baseFn.".html"; $priceOrderLink=$baseFn."_0" . PRICE_ASC_MARKER . ".html"; break;
        }       
      }          
    }  
    $step = PRODUCT_PER_PAGE;        
  
    $data = $db->GetArray("SELECT       SQL_CALC_FOUND_ROWS   
                                        p.*, m.filename, m.title AS metatitle,
                                                                        
                                                          
                                        (SELECT     COUNT(id) 
                                         FROM       " . TPX . "product_editions 
                                         WHERE      productid=p.id) AS editioncount
                                        
                           FROM         " . TPX . "products AS p
                           $joinSql
                           INNER JOIN   " . TPX . "meta AS m
                           ON           p.metaid = m.id                           
                           $whereSql
                           ORDER BY     $orderBy
                           LIMIT        " . $pg * $step . ", " . $step . "
    ");    
        
    
    $totalTmp = $db->GetRow("SELECT FOUND_ROWS() AS cnt;");
    $total = $totalTmp['cnt'];
    
    
    $prev = true; $prevPage = false;
    $next = true; $nextPage = false;
    
    
    if ($pg == 0) { $prev = false; } 
    else { $prevPage = $pg-1; }
    if ($total <= (($pg+1)*$step)) { $next = false; }
    else { $nextPage = $pg+1; }
    
    $nextPage = $baseFn . "_" . $nextPage . $lastChar . ".html";
    if (($prevPage == 0) && ($lastChar == '')) { $prevPage = $baseFn . ".html"; }
    else { $prevPage = $baseFn . "_" . $prevPage . $lastChar . ".html"; }
        
        
    $pages = array();
    for ($i=0;$i<=floor(($total-1)/$step);$i++) {
      $row['filename'] = $baseFn . "_" . $i . $lastChar . ".html";
      if (($i==0) && ($lastChar == '')) { $row['filename'] = $baseFn . ".html"; }
      
      $row['current'] = false; 
      if ($i==$pg) { $row['current'] = true; }
      
      $row['caption'] = $i+1;
            
      $pages[] = $row; 
    }


    $tpl->assign ("total", $total);
    $tpl->assign ("next", $next);
    $tpl->assign ("prev", $prev);
    $tpl->assign ("prevPage", $prevPage);
    $tpl->assign ("nextPage", $nextPage);    
    $tpl->assign ("pages", $pages);
    $tpl->assign ("lastChar", $lastChar);
    $tpl->assign ("titleOrderLink", $titleOrderLink);
    $tpl->assign ("priceOrderLink", $priceOrderLink);
    
    
    
    foreach ($data as $key => $value) {  
	$z=$data[$key]['manufacturer'];
	$sql="select m.title, e.filename from ia_manufacturer as m, ia_meta as e where m.id=$z and m.metaid=e.id LIMIT 1";
	$mytmp = $db->GetRow($sql);
	
	$data[$key]['manufacturer']=$mytmp['title'];
	$data[$key]['manufacturerurl']=$mytmp['filename'];

      if ($value["imgalt"] == "") { $data[$key]["imgalt"] = $value["metatitle"]; }
      if ($value["imgtitle"] == "") { $data[$key]["imgtitle"] = $value["metatitle"]; }
    
      if (($value["image"] != "") && (file_exists("upload/products/{$value["image"]}"))) { $data[$key]["image"] = "upload/products/" . $value["image"]; }
      else { $data[$key]["image"] = "images/nincs-kep.jpg"; }

      if ($value["editioncount"] == 0) {
        $data[$key]["addToCartFilename"] = $basicCartFilename . "_" . URL_PARAM_ADDCART . "_" . $value["id"];
      }
      else {
        $data[$key]["addToCartFilename"] = $value["filename"];
      }
      $data[$key]["price"] = getPriceData($value["price"], $value['vat']);      
      $data[$key]["priced"] = getPriceData($value["priced"], $value['vat']);
    }
    
    $tpl->assign ("data", $data);
    
    // 2012-04-24: terméklista helyett a kategória neve kerüljön a fejlécbe
    // --------------------------------------------------------------------
    if ($mod == "category") {
      $categoryData = $db->GetRow("SELECT * FROM " . TPX . "categories WHERE id=" . $db->qstr($item) . " LIMIT 1");
      $tpl->assign ("categoryData", $categoryData);
    }
    else if ($mod == "manufacturer-list") {
      $categoryData = $db->GetRow("SELECT * FROM " . TPX . "manufacturer WHERE id=" . $db->qstr($item) . " LIMIT 1");
      $tpl->assign ("categoryData", $categoryData);
    }
    // --------------------------------------------------------------------
  
    $template = "productlist.tpl";
      
    break;
  // ----------------------------------------------------------------------------------------------------------  
}

if (!isset($template)) { locationTo ("/"); }

// Kosáradatok átadása, ha szükséges
// ----------------------------------------------------------------------------------------------------------
if (array_key_exists ('cart',$_SESSION)) {
  $cartItems = 0;
  if ($_SESSION['cart']) { 
    $cartnow = unserialize($cartnow = $_SESSION['cart']);    
  }
  if (!$cartnow) { 
    $cartnow = array(); 
  }
}
else { $cartnow = array(); }

$cartSum = 0;
if ($cartnow) {
  foreach ($cartnow as $row) {
    $cartSum += $row['sumwithvat'];
  }
}

$tpl->assign ("cartData", $cartnow);
$tpl->assign ("cartSum", $cartSum);
$tpl->assign ("cartCount", sizeof($cartnow));


// Meta adatok beállítása
// ----------------------------------------------------------------------------------------------------------

/*
$changeLanguageFilename = $db->GetRow("SELECT filename FROM meta WHERE id=" . $db->qstr($changeLanguage) . " LIMIT 1");
$tpl->assign ("changeLanguage", (sizeof($changeLanguageFilename != 0) ? $changeLanguageFilename['filename']  . ".html" : "#"));  
*/

$metaTitle = $meta['title'];
$metaDescription = $meta['description'];
$metaKeywords = $meta['keywords'];
$metaHeader = $meta['header'];
$metaCanonical = $meta['canonical'];

if ($metaTitle == "") { $metaTitle = DEFAULT_TITLE; }
if ($metaDescription == "") { $metaDescription = DEFAULT_DESCRIPTION; }
if ($metaKeywords == "") { $metaKeywords = DEFAULT_KEYWORDS; }

$tpl->assign ("metaTitle", $metaTitle);
$tpl->assign ("metaDescription", $metaDescription);
$tpl->assign ("metaKeywords", $metaKeywords);
$tpl->assign ("metaHeader", $metaHeader);
$tpl->assign ("metaCanonical", $metaCanonical);
$tpl->assign ("metaFilename", $meta['filename']);
$tpl->assign ("metaLang", $meta['lang']);

$tpl->assign ("jsMsg", $jsMsg);

$tpl->assign ("freeDeliveryLimit", $freeDeliveryLimit);
$tpl->assign ("defaultDeliveryPrice", $defaultDeliveryPrice);
$tpl->assign ("paymentModes", $paymentModes);
$tpl->assign ("orderStatuses", $orderStatuses);

$tpl->assign ("userIsLogged", userId() !== false);
// ----------------------------------------------------------------------------------------------------------



$tpl->display ($template);

?>
