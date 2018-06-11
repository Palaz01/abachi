{include file='admin.header.tpl'}


{if sizeof($messages) != 0}
<div class="{$msgClass}">
{$messages}
</div>
{/if}

<form action="{$formAction}" method="post" enctype="multipart/form-data" name="mainform">
<input type="hidden" name="translatelang" value="" />

<div class="pageTitle">
  <h3>Főoldali dobozok adatai</h3>
</div>
<br />

<table>
{if $imageNeedUpload == true}
<tr>      
  <td valign="top">
    Doboz háttérkép:
  </td>
  <td>      
	  <input class="admin-text" type="file" name="image" />
  </td>
</tr>
{else}
<tr>      
  <td valign="top">
    Doboz háttérkép:
  </td>
  <td>      
	  <img src="{#pt#}upload/mainpagebox/{$image}&w=720&h=300" /> <br />
	  <input type="submit" class="admin-button"	name="delimage" value="Törlés" onclick="javascript: return confirm('Biztos, hogy törölni akarja ezt a képet?');" />
  </td>
</tr>
{/if}
{if false}
<tr>
  <td>
    Doboz háttérkép alt szöveg:
  </td>        
  <td>
    <input class="admin-text" type="text" name="imgalt" value="{$imgalt}" />
  </td>
</tr>      
<tr>
  <td>
    Doboz háttérkép title szöveg:
  </td>        
  <td>
    <input class="admin-text" type="text" name="imgtitle" value="{$imgtitle}" />
  </td>
</tr>     
{/if} 
<tr>
  <td valign="top">
    Doboz szöveg:
  </td>        
  <td>
    <input class="admin-text" type="text" name="boxtext" value="{$boxtext}" />
  </td>
</tr>      

</table>



<input type="hidden" name="ispostback" value="true" />

<div style="text-align: center">
  <input type="submit" class="admin-button" name="store" value="Tárolás" /> &nbsp; &nbsp; &nbsp;  
  <input type="button" class="admin-button" name="backbutton" value="Vissza" onclick="javascript: document.location = 'admin.php?mod=mainpageboxlist';" /> &nbsp; &nbsp; &nbsp;
</div>

</form>

{include file='admin.footer.tpl'}
