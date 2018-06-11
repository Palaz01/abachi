{include file='admin.header.tpl'}


{if sizeof($messages) != 0}
<div class="{$msgClass}">
{$messages}
</div>
{/if}

<form action="{$formAction}" method="post" enctype="multipart/form-data">

<h3>Szolgáltatás adatai</h3>
<table>
<tr>
  <td>
   Szolgáltatás:
  </td>        
  <td>
    <input class="admin-text" type="text" name="title" value="{$title}" style="width: 350px;" />
  </td>
</tr> 
<tr>      
  <td>
    Kiemelt:
  </td>
  <td>      
	  <input class="admin-text" type="checkbox" {if $kiemelt=='1'}checked="checked"{/if} name="kiemelt" />
  </td>
</tr>
	  <input type="hidden" name="sorrend" id="sorrend" value="{$mmx}" />

{if $imageNeedUpload == true}
<tr>      
  <td valign="top">
    Alapértelmezett kép:
  </td>
  <td>      
	  <input class="admin-text" type="file" name="image" />
  </td>
</tr>
{else}
<tr>      
  <td valign="top">
    Alapértelmezett kép:
  </td>
  <td>      
	  <img src="{#pt#}upload/articles/{$image}&w=320&h=200" /> <br />
	  <input type="submit" class="admin-button"	name="delimage" value="Kép törlése" onclick="javascript: return confirm('Biztos, hogy törölni akarod ezt a képet?');" />
  </td>
</tr>
{/if}
<tr>
  <td>
    Alapértelmezett kép alt:
  </td>        
  <td>
    <input class="admin-text" type="text" name="imgalt" value="{$imgalt}" />
  </td>
</tr>      
<tr>
  <td>
    Alapértelmezett kép title:
  </td>        
  <td>
    <input class="admin-text" type="text" name="imgtitle" value="{$imgtitle}" />
  </td>
</tr>

<tr>
  <td>
    Tovább link:
  </td>        
  <td>
    <input class="admin-text" type="text" name="morelink" value="{$morelink}" style="width: 200px;" />
  </td>
</tr>
<tr>
  <td>
    Tovább link title:
  </td>        
  <td>
    <input class="admin-text" type="text" name="moretitle" value="{$moretitle}" style="width: 250px;" />
  </td>
</tr>      

<tr>
  <td>
    &nbsp;
  </td>
</tr>

  <td>
    Bevezető:
  </td>        
  <td>
    <textarea name="intro" style="width: 400px; height: 100px;">{$intro}</textarea>
  </td>
</tr>      
<tr>
  <td valig="top">
    Szöveg:
  </td>
  <td>
    <textarea name="content" id="content" style="width: 600px; height: 400px;">{$content}</textarea>
    {include file='admin.initmce-default.tpl'}
	  <script type="text/javascript">
    tinyMCE.execCommand("mceAddControl", true, "content");
    </script>
  </td>
</tr>
<tr>
  <td>
    Látható:
  </td>        
  <td>
    <input type="checkbox" name="public" {if $public=='1'}checked="checked"{/if} />
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
        <img src="{#pt#}upload/articles/{$image.filename}&w=300&h=200" />        
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

{include file='admin.tags.tpl'}


{include file='admin.metafields.tpl'}
  


<input type="hidden" name="ispostback" value="true" />

<div style="text-align: center">
  <input type="submit" class="admin-button" name="store" value="Tárolás" /> &nbsp; &nbsp; &nbsp;  
  <input type="button" class="admin-button" name="backbutton" value="Vissza" onclick="javascript: document.location = 'admin.php?mod=szolgaltatasok';" /> &nbsp; &nbsp; &nbsp;
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
