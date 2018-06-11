<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/template_human_hu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
	<meta http-equiv="content-type" content="application.xhtml+xml; charset=utf-8" />
	<meta http-equiv="content-language" content="hu" />
  <meta name="description" content="{$metaDescription}" />
  <meta name="keywords" content="{$metaKeywords}" />
  <title>{$metaTitle}</title>
	<meta name="author" content="ElevenElemek" />
	<meta name="copyright" content="Nutra Pharma" />
	<link href="user_files/css/all.css" rel="stylesheet" type="text/css" media="all" />
	<link href="user_files/css/impromptu.css" rel="stylesheet" type="text/css" media="all" />
	<link href="user_files/css/print.css" rel="stylesheet" type="text/css" media="print" />
	<link href="user_files/image/favicon.ico" rel="shortcut icon" type="image/x-icon" />
	<script type="text/javascript" src="user_files/js/all.js"></script>
	<script type="text/javascript" src="user_files/js/common.js"></script>	
	<script type="text/javascript" src="user_files/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="user_files/js/jquery-impromptu.2.7.min.js"></script>	

</head>
<body>
		
    <div id="contentArea">
			<div id="content">
				<div id="sidebarLeft">
					<div id="subMenuArea">
						<ul id="subMenu">
							<li><a href="{$mainFilename}">Főoldal</a></li>
							<li><a href="{$registerFilename}">Regisztráció</a></li>
							<li><a href="{$loginFilename}">Bejelentkezés</a></li>
							<li><a href="{$logoutFilename}">Kijelentkezés</a></li>
							<li><a href="{$contactFilename}">Kapcsolatfelvétel</a></li>
							<li><a href="{$manufacturerListFilename}">Gyártók listája</a></li>
							<li><a href="{$pgDeliveryFilename}">Szállítás és visszaküldés</a></li>
							<li><a href="{$pgPaymentModeFilename}">Fizetési módok</a></li>
							<li><a href="{$pgLegalFilename}">Jogi figyelmeztetés</a></li>
							<li><a href="{$pgTermsConditionsFilename}">Használat feltételei</a></li>
							<li><a href="{$cartFilename}">Kosár</a></li>
						</ul>
					</div>
					<strong>
          {if $cartSum!=0}
          A kosárban {$cartCount} termék van, {$cartSum} Ft
          {else}
          A kosár üres.
          {/if}
          </strong>
          <form action="{$searchResultsFilename}" method="post">
            <input type="text" name="searchpattern" value="" />
            <input type="submit" name="dosearch" value="Keresés" />
          </form>
