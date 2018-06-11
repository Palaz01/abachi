<?php

DEFINE ("DSN","mysqli://abachi:abachi@localhost:3306/1116_abachiszauna_hu");
$WEAK_ENCRYPT_KEY = "nabkfjgalqjk897tgthgkjnazmn23iuhtoerjhs";

DEFINE ("ARTICLE_PER_PAGE", 10);
DEFINE ("PRODUCT_PER_PAGE", 20);

DEFINE ("TITLE_DESC_MARKER", "a");
DEFINE ("PRICE_ASC_MARKER", "b");
DEFINE ("PRICE_DESC_MARKER", "c");

DEFINE ('ORDER_ASC',0);
DEFINE ('ORDER_DESC',1);

DEFINE ('DEFAULT_TITLE','');
DEFINE ('DEFAULT_KEYWORDS','');
DEFINE ('DEFAULT_DESCRIPTION','');

DEFINE ('DEFAULT_PARAM', 'mod=main');

DEFINE ('DEFAULT_EMAIL', 'office@abachiszauna.hu');

DEFINE ("DEFEXT", '.html');

DEFINE ('DEFDOMAIN', 'abachiszauna.hu');


$languages = array(
  "1" => "Magyar",  
);

DEFINE ('MAIN_PAGE', 1);
DEFINE ('REGISTER', 2);
DEFINE ('CONTACT', 3);
DEFINE ('LOGIN', 4);
DEFINE ('USER_MODIFY', 5);
DEFINE ('LOGOUT', 6);
DEFINE ('FORGOT_PASSWORD', 7);
DEFINE ('CART', 8);
DEFINE ('REVIEW', 9);
DEFINE ('ARTICLELIST', 10);
DEFINE ('USERCENTER', 11);
DEFINE ('PREVIOUSORDERS', 12);
DEFINE ('MANUFACTURERLIST', 13);
DEFINE ('SEARCHRESULTS', 14);
DEFINE ('SEARCH', 15);
DEFINE ('DISCOUNT', 16);
DEFINE ('PAGE_DELIVERY', 100);
DEFINE ('PAGE_PAYMENT_MODE', 101);
DEFINE ('PAGE_LEGAL', 102);
DEFINE ('PAGE_TERMS_CONDITIONS', 103);
DEFINE ('PAGE_THANK_YOU', 104);
DEFINE ('BEMUTATK', 110);
DEFINE ('IMPR', 120);
DEFINE ('SZOLG', 130);
DEFINE ('HIRLEVEL', 131);
DEFINE ('VFIZ', 132);
DEFINE ('VSZALL', 133);
DEFINE ('VCIM', 134);
DEFINE ('LINKEK', 140);


$commonMeta['1'] = array(
  MAIN_PAGE => 1,
  REGISTER => 2,
  CONTACT => 3,
  LOGIN => 4,
  USER_MODIFY => 5,
  LOGOUT => 6,
  FORGOT_PASSWORD => 7,
  CART => 8,
  REVIEW => 9,
  ARTICLELIST => 10,
  USERCENTER => 11,
  PREVIOUSORDERS => 12,
  MANUFACTURERLIST => 13,
  SEARCHRESULTS => 14,
  SEARCH => 15,
  DISCOUNT => 16,
  PAGE_DELIVERY => 100,
  PAGE_PAYMENT_MODE => 101,
  PAGE_LEGAL => 102,
  PAGE_TERMS_CONDITIONS => 103,
  PAGE_THANK_YOU => 104,
  BEMUTATK => 110,
  SZOLG => 130,
  HIRLEVEL => 131,
  VFIZ => 132,
  VSZALL => 133,
  VCIM => 134,
  IMPR => 120,
  LINKEK => 140
);

$orderStatuses = array(
  "0" => "Beérkezett",
  "1" => "Feldogozás alatt",
  "4" => "Szállítás alatt",
  "2" => "Teljesített", 
  "3" => "Törölt"
);

DEFINE ('TPX', 'ia_');

DEFINE ('URL_PARAM_ADDCART', 'kosarba');

$freeDeliveryLimit = 10000;
//$defaultDeliveryPrice = 800;
$defaultDeliveryPrice = 0;
$paymentModes = array(
  "0" => "Postai utánvét",
  "1" => "Banki előreutalás"
);

DEFINE ('SETTING_MANUFACTURERS_IN_FRAME', 1);

//ini_set("display_startup_errors", "off");
//ini_set("display_errors", "off");
//ini_set("error_reporting", E_NONE);
//ini_set("display_startup_errors", "on");
//ini_set("display_errors", "on");
//ini_set("error_reporting", E_ALL);
 

?>
