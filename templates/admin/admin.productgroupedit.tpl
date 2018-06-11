{include file='admin.header.tpl'}


{if sizeof($messages) != 0}
<div class="{$msgClass}">
{$messages}
</div>
{/if}

<form action="{$formAction}" method="post" enctype="multipart/form-data" onsubmit="javascript: populateHidden();">

<h3>Termékcsoport adatai</h3>
<table>
<tr>
  <td>
    Termékcsoport neve:
  </td>        
  <td>
    <input class="admin-text" type="text" name="title" value="{$title}" />
  </td>
</tr>      
<tr>
  <td>
    Nettó ár:
  </td>        
  <td>
    <input class="admin-text" type="text" name="price" value="{$price}" /> <strong>Ft</strong>
    {if $finalPrice!=0}
      <small>(bruttó ár: {$finalPrice} Ft)</small>
    {/if}
  </td>
</tr>      
<tr>
  <td>
    Akciós nettó ár:
  </td>        
  <td>
    <input class="admin-text" type="text" name="priced" value="{$priced}" /> <strong>Ft</strong>
    {if $finalPriced!=0}
      <small>(bruttó ár: {$finalPriced} Ft)</small>
    {/if}
  </td>
</tr>
<tr>
  <td>
    Áfa kulcs:
  </td>        
  <td>
    <input class="admin-text" type="text" name="vat" value="{$vat}" /> <strong>%</strong>
  </td>
</tr>

<tr>
  <td>
    Leírás:
  </td>        
  <td>
    <textarea style="width: 600px; height: 400px;" name="description" id="description">{$description}</textarea>
    {include file='admin.initmce-default.tpl'}
	  <script type="text/javascript">
    tinyMCE.execCommand("mceAddControl", true, "description");
    </script>
  </td>
</tr>      
{if $imageNeedUpload == true}
<tr>      
  <td valign="top">
    Kép:
  </td>
  <td>      
	  <input class="admin-text" type="file" name="image" />
  </td>
</tr>
{else}
<tr>      
  <td valign="top">
    Kép:
  </td>
  <td>      
	  <img src="{#pt#}upload/productgroup/{$image}&w=320&h=200" /> <br />
	  <input type="submit" class="admin-button"	name="delimage" value="Kép törlése" onclick="javascript: return confirm('Biztos, hogy törölni akarod ezt a képet?');" />
  </td>
</tr>
{/if}
<tr>
  <td>
    Kép alt szöveg:
  </td>        
  <td>
    <input class="admin-text" type="text" name="imgalt" value="{$imgalt}" />
  </td>
</tr>      
<tr>
  <td>
    Kép title szöveg:
  </td>        
  <td>
    <input class="admin-text" type="text" name="imgtitle" value="{$imgtitle}" />
  </td>
</tr>      

</table>

<h3>Csoporthoz tartozó termékek</h3>

{include file='admin.my.productselector.tpl'}
  
{include file='admin.metafields.tpl'}
  


<input type="hidden" name="ispostback" value="true" />

<div style="text-align: center">
  <input type="submit" class="admin-button" name="store" value="Tárolás" /> &nbsp; &nbsp; &nbsp;  
  <input type="button" class="admin-button" name="backbutton" value="Vissza" onclick="javascript: document.location = 'admin.php?mod=productgrouplist';" /> &nbsp; &nbsp; &nbsp;
</div>

</form>

{include file='admin.footer.tpl'}
