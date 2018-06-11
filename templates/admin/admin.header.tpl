<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="hu" />
<script language="JavaScript" type="text/javascript" src="js/prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="js/actb-common.js"></script>
<script language="JavaScript" type="text/javascript" src="js/actb.js"></script>
<script type="text/javascript" src="inc/tinymce/tiny_mce.js"></script>
<script type="text/javascript" src="inc/tinymce/plugins/tinybrowser/tb_tinymce.js.php"></script>
<link rel="stylesheet" href="style/admin.css" type="text/css" media="all" />
<link type="text/css" rel="stylesheet" href="js/dhtmlgoodies_calendar.css" media="screen"></link>
<script type="text/javascript" src="js/dhtmlgoodies_calendar.js"></script>
<title>Adminisztrációs felület</title>
</head>
<body style="background-color:#F7F6F3;">
<table class="main" width="99%">
  <tr>    
    <td class="menutd">
      <!--span class="menutitle">Adminisztrációs felület</span -->
      <ul style="margin-left:-20px; margin-top:-20px">
	<div style="margin-left:-5px;margin-bottom:10px; padding-left:5px; width: 90%; border: 1px solid grey">
        <div align="center" style="background-color:#C0C0C0; width:100%; margin-left:-4px; border: 1px solid green"">Adminisztráció</div>	
	<li><a class="admin-menu-link" {$selectedMenu99} href="admin.php?mod=adminmain">Kezdőlap</a></li>	
        <li><a class="admin-menu-link" href="admin.php?mod=logout">Kijelentkezés</a></li>
	</div>
	
	<div style="margin-left:-5px;margin-bottom:10px; padding-left:5px; width: 90%; border: 1px solid grey">
        <div align="center" style="background-color:#C0C0C0; width:100%; margin-left:-4px; border: 1px solid green"">WEBSHOP</div>
	<li><a class="admin-menu-link" {$selectedMenu14} href="admin.php?mod=mainpage">Nyitó oldal beállítása</a></li>
	<li><a class="admin-menu-link" {$selectedMenu202} href="admin.php?mod=mainpageboxlist">Nyitó oldal képek</a></li>
	<li><a class="admin-menu-link" {$selectedMenu6} href="admin.php?mod=productcategorylist">Termékkategóriák</a></li>
        <li><a class="admin-menu-link" {$selectedMenu7} href="admin.php?mod=manufacturerlist">Gyártók</a></li>
        <li><a class="admin-menu-link" {$selectedMenu9} href="admin.php?mod=productslist">Termékek</a></li>
	<li>&nbsp;</li>
	<li><a class="admin-menu-link" {$selectedMenu13} href="admin.php?mod=orderlist">Megrendelések</a></li>        
	<li><a class="admin-menu-link" {$selectedMenu77} href="admin.php?mod=delivery">Szállítási mód</a></li>  	
	</div>
	
	<div style="maring-top:10px; margin-left:-5px; padding-left:5px; width: 90%; border: 1px solid grey">	
	<div align="center" style="background-color:#C0C0C0; width:100%; margin-left:-4px; border: 1px solid green"">Dinamikus tartalom</div>
	<li><a class="admin-menu-link" {$selectedMenu1} href="admin.php?mod=pagelist">Szerkeszthető oldalak</a></li>
        <li><a class="admin-menu-link" {$selectedMenu2} href="admin.php?mod=articlelist">Hasznos tudnivalók</a></li>
	<li><a class="admin-menu-link" {$selectedMenu18}  href="admin.php?mod=szolgaltatasok">Szolgáltatások</a></li>
	<li><a class="admin-menu-link" {$selectedMenu8} href="admin.php?mod=textslist">Szövegek</a></li>
	</div>
	<li>&nbsp;</li>	
	<div style="maring-top:10px; margin-left:-5px; padding-left:5px; width: 90%; border: 1px solid grey">		
	<div align="center" style="background-color:#C0C0C0; width:100%; margin-left:-4px; border: 1px solid green"">Látogatók</div>
        <li><a class="admin-menu-link" {$selectedMenu10} href="admin.php?mod=userlist">Felhasználók</a></li>        
	<li><a class="admin-menu-link" {$selectedMenu5} href="admin.php?mod=contactslist">Kapcsolatfelvétel</a></li>
        <li><a class="admin-menu-link" {$selectedMenu12} href="admin.php?mod=comment">Hozzászólások</a></li>
	<li><a class="admin-menu-link" {$selectedMenu20}  href="admin.php?mod=hirlevel">Hírlevél feliratkozások</a></li>
	</div>
	<li>&nbsp;</li>	
	<div style="maring-top:10px; margin-left:-5px; padding-left:5px; width: 90%; border: 1px solid grey">	
	<div align="center" style="background-color:#C0C0C0; width:100%; margin-left:-4px; border: 1px solid green"">Technikai menüpontok</div>
        <li><a class="admin-menu-link" {$selectedMenu3} href="admin.php?mod=metalist">SEO</a></li>
        <li><a class="admin-menu-link" {$selectedMenu4} href="admin.php?mod=passchange">Jelszóváltoztatás</a></li>
	</div>
	
	{if $userLevel>=1}
	<li>&nbsp;</li>	
	<div style="maring-top:10px; margin-left:-5px; padding-left:5px; width: 90%; border: 1px solid grey">	
	<div align="center" style="background-color:#C0C0C0; width:100%; margin-left:-4px; border: 1px solid green"">AutoSEO</div>
  	<li><a class="admin-menu-link" {$selectedMenu201} href="admin.php?mod=autoseomanage">AutoSEOra jelölt tartalmak</a></li>
    <li><a class="admin-menu-link" {$selectedMenu200} href="admin.php?mod=autoseolist">AutoSEO javaslatai</a></li> 
	</div>
	{/if}
	
      </ul>
      <div style="height: 400px;">&nbsp;</div>
    </td>
    <td class="contenttd">
    
