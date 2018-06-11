{include file='admin.header.tpl'}


{if sizeof($messages) != 0}
<div class="{$msgClass}">
{$messages}
</div>
{/if}

<form action="{$formAction}" method="post" enctype="multipart/form-data">

<h3>Oldal adatai</h3>
<table>
<tr>
  <td>
    Oldal címe:
  </td>        
  <td>
    <input class="admin-text" type="text" name="title" value="{$title}" />
  </td>
</tr>      
<tr>
  <td>
    Tartalom:
  </td>        
  <td>
    <textarea style="width: 600px; height: 400px;" name="description" id="description">{$description}</textarea>
    {include file='admin.initmce-default.tpl'}
	  <script type="text/javascript">
    tinyMCE.execCommand("mceAddControl", true, "description");
    </script>
  </td>
</tr>      

</table>




{if $id!==false}
<h3>Képek feltöltése</h3>
<table>
  <tr>
    <td>
      Képfájl:
    </td>
    <td>
      <input type="file" name="imageup" />
    </td>
  </tr>
  <tr>
    <td>
      Kép címe:
    </td>
    <td>
      <input class="admin-text" type="text" name="imagetitle" />
    </td>
  </tr>
  <tr>
    <td>
      Kép alt szövege:
    </td>
    <td>
      <input class="admin-text" type="text" name="imagemetaalt" />
    </td>
  </tr>
  <tr>
    <td>
      Kép title szövege:
    </td>
    <td>
      <input class="admin-text" type="text" name="imagemetatitle" />
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <center>
        <input class="admin-button" type="submit" name="store_image" value="Kép feltöltése" />
      </center>
    </td>
  </tr>
</table>

<h3>Képek szerkesztése</h3>

{if sizeof($images)==0}
  A cikkhez még nincsenek képek feltöltve!
{else}
  <table id="imagetable">    
    <tr>
      <th>Kép</th>
      <th>Leírás</th>
      <th>Alt szöveg</th>
      <th>Title szöveg</th>
      <th>&nbsp;</th>
    </tr>
    {foreach from=$images item=image name=imageforeach}
    <tr>
      <td valign="top">
        <img src="{#pt#}upload/page/{$image.filename}&w=300&h=200" />        
      </td>
      <td valign="top">
        <input type="text" class="admin-text" name="imagesettitle-{$image.id}" value="{$image.title}" />
      </td>
      <td valign="top">
        <input type="text" class="admin-text" name="imagesetmetaalt-{$image.id}" value="{$image.imgalt}" />
      </td>              
      <td valign="top">
        <input type="text" class="admin-text" name="imagesetmetatitle-{$image.id}" value="{$image.imgtitle}" />
      </td>
      <td valign="top">
        {if $smarty.foreach.imageforeach.index!=0}
          <input class="admin-button" type="submit" name="set_image" value="Feljebb" onclick="javascript: setmsg('higher', {$image.id})" />
        {/if}
        &nbsp;
        {if $smarty.foreach.imageforeach.index!=sizeof($images)-1}
          <input class="admin-button" type="submit" name="set_image" value="Lejjebb" onclick="javascript: setmsg('lower', {$image.id})" />
        {/if}
      </td>
      <td valign="top">
        <input class="admin-button" type="submit" name="set_image" value="Törlés" onclick="javascript: if (confirm('Biztos, hogy törölni akarja ezt a képet ({$image.title})?')) {literal}{{/literal} setmsg('delete', {$image.id}) {literal}} else { return false; } {/literal}" />
      </td>   
    </tr>
    {/foreach}
    <tr>
      <td colspan="4">
        <center>        
          <input class="admin-button" type="submit" name="set_image" value="Változtatások tárolása" />
        </center>
      </td>
    </tr>
  </table>
  <input type="hidden" name="image_sort_msg" id="image_sort_msg" value="" /> 
{/if}

{/if}




  
{include file='admin.metafields.tpl'}
  


<input type="hidden" name="ispostback" value="true" />

<div style="text-align: center">
  <input type="submit" class="admin-button" name="store" value="Tárolás" /> &nbsp; &nbsp; &nbsp;  
  <input type="button" class="admin-button" name="backbutton" value="Vissza" onclick="javascript: document.location = 'admin.php?mod=pagelist';" /> &nbsp; &nbsp; &nbsp;
</div>

</form>


{literal}
<script type="text/javascript">

function setmsg(direction, id) {
  document.getElementById('image_sort_msg').value = direction + '-' + id;
}

</script> 
{/literal}

{$extraJs}


{include file='admin.footer.tpl'}
