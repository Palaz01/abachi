{include file='admin.header.tpl'}


{if sizeof($messages) != 0}
<div class="{$msgClass}">
{$messages}
</div>
{/if}

<form action="admin.php?mod=metaedit&id={$id}" method="post">

<h3>Meta adatok</h3>
<table>
  <tr>
    <td>
      Fájlnév:
    </td>
    <td>      
      <input  class="admin-text" type="text" name="filename" value="{$filename}" style="width: 500px;" /> <b>. html</b>
    </td>
  </tr>
  <tr>
    <td>
      Title:
    </td>
    <td>      
      <input class="admin-text" type="text" name="title" value="{$title}" style="width: 500px;" />	    
    </td>
  </tr>
  <tr>
    <td>
      Description:
    </td>
    <td>      
      <input class="admin-text" type="text" name="description" value="{$description}" style="width: 500px;" />
    </td>
  </tr>
  <tr>
    <td>
      Keywords:
    </td>
    <td>      
      <input class="admin-text" type="text" name="keywords" value="{$keywords}" style="width: 500px;" />
    </td>
  </tr>
  <tr>
    <td>
      H1:
    </td>
    <td>      
      <input class="admin-text" type="text" name="header" value="{$header}" style="width: 500px;" />
    </td>
  </tr>
  <tr>
    <td>
      Canonical:
    </td>
    <td>      
      <input class="admin-text" type="text" name="canonical" value="{$canonical}" style="width: 500px;" /> <b>. html</b>
    </td>
  </tr>
</table>

<input type="hidden" name="ispostback" value="true" />

<div style="text-align: center">
  <input type="submit" class="admin-button" name="store" value="Tárolás" /> &nbsp; &nbsp; &nbsp;  
  <input type="button" class="admin-button" name="backbutton" value="Vissza" onclick="javascript: document.location = 'admin.php?mod=metalist';" /> &nbsp; &nbsp; &nbsp;
</div>


</form>

{include file='admin.footer.tpl'}
