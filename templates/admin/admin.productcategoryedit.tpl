{include file='admin.header.tpl'}


{if sizeof($messages) != 0}
<div class="{$msgClass}">
{$messages}
</div>
{/if}

<form action="{$formAction}" method="post" enctype="multipart/form-data" onsubmit="javascript: return checkNames();">

<h3>Termékkategória adatai</h3>
<table>
<tr>
  <td>
    Kategória név:
  </td>        
  <td>
    <input class="admin-text" type="text" name="title" value="{$title}" />
  </td>
</tr>      
<tr>      
  <td>
    Szülő kategória:
  </td>
  <td>      
	  <select name="parent" class="admin-select">
      {html_options options=$parentOptions selected=$parent}
    </select>
  </td>
</tr>
</table>

{include file='admin.metafields.tpl'}


<input type="hidden" name="ispostback" value="true" />

<div style="text-align: center">
  <input type="submit" class="admin-button" name="store" value="Tárolás" /> &nbsp; &nbsp; &nbsp;  
  <input type="button" class="admin-button" name="backbutton" value="Vissza" onclick="javascript: document.location = 'admin.php?mod=productcategorylist';" /> &nbsp; &nbsp; &nbsp;
</div>

</form>

{include file='admin.footer.tpl'}
