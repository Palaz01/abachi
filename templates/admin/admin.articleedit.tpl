
{include file='admin.header.tpl'}


{if sizeof($messages) != 0}
<div class="{$msgClass}">
{$messages}
</div>
{/if}

<form action="{$formAction}" method="post" enctype="multipart/form-data">

<h3>Hír adatai</h3>
<table>
<tr>
  <td>
    Hír címe:
  </td>        
  <td>
    <input class="admin-text" type="text" name="title" value="{$title}" />
  </td>
</tr>      
<tr>      
  <td>
    Dátum:
  </td>
  <td>      
	  <input class="admin-text" type="text" value="{$artdate}" readonly="readonly" name="artdate" /><input type="button" value="Választ" onclick="displayCalendar(document.forms[0].artdate,'yyyy-mm-dd',this)" class="admin-button" />
  </td>
</tr>
<tr>
  <td>
    Bevezető:
  </td>        
  <td>
    <textarea style="width: 500px; height: 200px;" name="intro">{$intro}</textarea>
  </td>
</tr>      
<tr>
  <td>
    Leírás:
  </td>        
  <td>
    <textarea style="width: 700px; height: 400px;" name="description" id="description">{$description}</textarea>
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
	  <img src="{#pt#}upload/article/{$image}&w=320&h=200" /> <br />
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
<tr>
  <td>
    Publikus hír:
  </td>        
  <td>
    <input type="checkbox" name="public" {if $public=='1'}checked="checked"{/if} />
  </td>
</tr>      

</table>

{include file='admin.tags.tpl'}
  
{include file='admin.metafiselds.tpl'}
  


<input type="hidden" name="ispostback" value="true" />

<div style="text-align: center">
  <input type="submit" class="admin-button" name="store" value="Tárolás" /> &nbsp; &nbsp; &nbsp;  
  <input type="button" class="admin-button" name="backbutton" value="Vissza" onclick="javascript: document.location = 'admin.php?mod=articlelist';" /> &nbsp; &nbsp; &nbsp;
</div>

</form>

{include file='admin.footer.tpl'}
