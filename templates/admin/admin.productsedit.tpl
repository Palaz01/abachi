{include file='admin.header.tpl'}


{if sizeof($messages) != 0}
<div class="{$msgClass}">
{$messages}
</div>
{/if}

<form action="{$formAction}" method="post" enctype="multipart/form-data">

<h3>Termék adatai</h3>
<table>
<tr>
  <td>
    Cikkszám:
  </td>        
  <td>
    <input style="width: 400px;" class="admin-text" type="text" name="cikkszam" value="{$cikkszam}" />
  </td>
</tr>
<tr>
  <td>
    Termék neve:
  </td>        
  <td>
    <input style="width: 400px;" class="admin-text" type="text" name="title" value="{$title}" />
  </td>
</tr>
<tr>
  <td>
    Kiemelés újdonságként:
  </td>        
  <td>
    <input  type="checkbox" name="gender" {if $gender==1}checked="checked"{/if}/>
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
    Raktáron?:
  </td>        
  <td>
    <input id="is" type="checkbox" name="instock" {if $instock=='1'}checked="checked"{/if} /> <label for="is">Igen</label>
  </td>
</tr>          
<tr>      
  <td>
    Gyártó:
  </td>
  <td>      
	  <select name="manufacturer" class="admin-select">
      {html_options options=$manufacturerOptions selected=$manufacturer}
    </select>
  </td>
</tr>  
<tr>
  <td>
    Szöveg:
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
	  <img src="{#pt#}upload/products/{$image}&w=320&h=200" /> <br />
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
  <td valign="top">
    Kategóriák:
  </td>
  <td valign="top">    
  
    <select name="categories[]" size="10" multiple="multiple" style="width: 500px;">
      {html_options options=$categoryOptions selected=$categories}
    </select>  
  </td>
</tr>
<tr>      
  <td valign="top">
    Szövegek:
  </td>
  <td valign="top">
    <select name="texts[]" size="10" multiple="multiple" style="width: 500px;">
      {html_options options=$textOptions selected=$texts}    
    </select>        
  </td>
</tr>
<tr>      
  <td valign="top">
    Megtekintések száma:
  </td>
  <td valign="top">    
    <strong>{$productcounter} alkalom</strong>    
  </td>
</tr>
<tr>      
  <td valign="top">
    Megrendelések:
  </td>
  <td valign="top">    
    <strong>{$ordercounter} darab</strong>    
  </td>
</tr>
</table>

{if $id}


<br /><br />

{if sizeof($productEditions)!=0}
<h3>Termék változatok</h3>
<table border="1">
  <tr>
    <th width="35%">Változat neve</th>
    <th width="15%"><span id="def-tr1">Nettó ár különbség</span><span id="mod-tr1" style="display: none;">Ár különbség iránya</span></th>
    <th width="30%"><span id="def-tr2">Termék változat bruttó ára</span><span id="mod-tr2" style="display: none;">Nettó ár különbség</span></th>
    <th width="10%">&nbsp;</th>
    <th width="10%">&nbsp;</th>
  </tr>
  
  {foreach from=$productEditions item=edition}
    <tr>
      <td>
        <center>
          <span id="span-title-{$edition.id}">
            {$edition.title}
          </span>
          <span id="text-title-{$edition.id}" style="display: none">
            <input type="text" name="modify_edition_name[{$edition.id}]" value="{$edition.title|escape}" />
          </span>
        </center>
      </td>
      <td>
        <center>
          <span id="span-pricedifference-{$edition.id}">
            {$edition.pricedifference} <strong>Ft</strong> 
          </span>
          <span id="select-signum-{$edition.id}" style="display: none;">
            <select name="modify_edition_signum[{$edition.id}]">
              <option value="+" {if $edition.pricedifference>=0}selected="selected"{/if}>Drágább</option>
              <option value="-" {if $edition.pricedifference<0}selected="selected"{/if}>Olcsóbb</option>
            </select>
          </span>
        </center>
      </td>
      <td>
        <center>
          <span id="span-finalprice-{$edition.id}">
            {$edition.finalprice} <strong>Ft</strong>
          </span>        
          <span id="text-pricedifference-{$edition.id}" style="display: none">
            <input type="text" id="modtxt{$edition.id}" name="modify_edition_difference[{$edition.id}]" value="{$edition.pricedifference}" style="width: 50px;" /> <strong>Ft</strong>
          </span>          
        </center>          
      </td>
      <td>
        <center>
          <div id="button-delete-{$edition.id}">
            <input type="submit" class="admin-button" name="delete_edition[{$edition.id}]" value="Változat törlése" onclick="javascript: return confirm('Valóban törölni akarja ezt a termékváltozatot?')" />
          </div>
          <div id="button-commit-{$edition.id}" style="display: none;">
            <input type="submit" class="admin-button" name="modify_edition[{$edition.id}]" value="Tárolás" />                        
          </div>
        </center>
      </td>
      <td>
        <center>              
          <div id="button-modify-{$edition.id}">
            <input type="button" class="admin-button" name="edit_edition[{$edition.id}]" value="Változat módosítása" onclick="javascript: startModify({$edition.id});" />
          </div>            
          <div id="button-cancel-{$edition.id}" style="display: none;">            
            <input type="button" class="admin-button" name="cancel_edition[{$edition.id}]" value="Mégsem" onclick="javascript: endModify({$edition.id});" />            
          </div>          
        </center>
      </td>
    </tr>
  {/foreach}
  
</table>
{/if}

<br /><br />

<center>
  <input type="button" value="Új változat felvétele" id="newedbutton" class="admin-button" name="newed" onclick="javascript: newEdition();" />
</center>

<table id="new-edition" style="display: none;">
  <tr>
    <td colspan="2">
      <h3>Új változat adatai</h3>
    </td>
  </tr>
  <tr>
    <td>
      Változat neve:
    </td>
    <td>
      <input type="text" style="width: 250px;" name="new_edition_name" value="" />
    </td>    
  </tr>
  <tr>
    <td>
      Változat ár különbség iránya:
    </td>
    <td>
      <select name="new_edition_signum">
        <option value="+">Drágább</option>
        <option value="-">Olcsóbb</option>
      </select>
    </td>    
  </tr>
  <tr>
    <td valign="top">
      Változat ár különbsége:
    </td>
    <td valign="top">
      <input type="text" style="width: 50px;" name="new_edition_difference" value="" /> <strong>Ft</strong>
      <br /><small>(a nettó árhoz képest)</small>
    </td>    
  </tr>
  <tr>
    <td colspan="2">
      <input type="submit" class="admin-button" name="store_new_edition" value="Változat mentése" />
      &nbsp;
      <input type="button" class="admin-button" name="cancel_new_edition" value="Változat elvetése" onclick="javascript: cancelEdition();" />
    </td>
  </tr>
</table>

{/if}

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
        <img src="{#pt#}upload/products/{$image.filename}&w=300&h=200" />        
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
  <input type="button" class="admin-button" name="backbutton" value="Vissza" onclick="javascript: document.location = 'admin.php?mod=productslist';" /> &nbsp; &nbsp; &nbsp;
</div>

</form>

{literal}
<script type="text/javascript">
function newEdition() {
  document.getElementById('new-edition').style.display = 'block';
  document.getElementById('newedbutton').style.display = 'none';
}

function cancelEdition() {
  document.getElementById('new-edition').style.display = 'none';
  document.getElementById('newedbutton').style.display = 'block';
}

function startModify(i) {
  {/literal}
  {foreach from=$productEditions item=edition}
    endModify({$edition.id});
    var txt=document.getElementById('modtxt{$edition.id}');
    if (txt.value.substring(0,1) == "-") {literal} {
      txt.value = txt.value.substring(1, txt.value.length);
    {/literal} }
  {/foreach}
  {literal}
  
  document.getElementById('span-title-'+i).style.display = 'none';
  document.getElementById('span-pricedifference-'+i).style.display = 'none';
  document.getElementById('span-finalprice-'+i).style.display = 'none';
  document.getElementById('button-delete-'+i).style.display = 'none';
  document.getElementById('button-modify-'+i).style.display = 'none';
  document.getElementById('def-tr1').style.display = 'none';
  document.getElementById('def-tr2').style.display = 'none';
  
  document.getElementById('text-title-'+i).style.display = 'block';
  document.getElementById('select-signum-'+i).style.display = 'block';
  document.getElementById('text-pricedifference-'+i).style.display = 'block';
  document.getElementById('button-commit-'+i).style.display = 'block';
  document.getElementById('button-cancel-'+i).style.display = 'block';
  document.getElementById('mod-tr1').style.display = 'block';
  document.getElementById('mod-tr2').style.display = 'block';
}

function endModify(i) {
  document.getElementById('span-title-'+i).style.display = 'block';
  document.getElementById('span-pricedifference-'+i).style.display = 'block';
  document.getElementById('span-finalprice-'+i).style.display = 'block';
  document.getElementById('button-delete-'+i).style.display = 'block';
  document.getElementById('button-modify-'+i).style.display = 'block';
  document.getElementById('def-tr1').style.display = 'block';
  document.getElementById('def-tr2').style.display = 'block';
  
  document.getElementById('text-title-'+i).style.display = 'none';
  document.getElementById('select-signum-'+i).style.display = 'none';
  document.getElementById('text-pricedifference-'+i).style.display = 'none';
  document.getElementById('button-commit-'+i).style.display = 'none';
  document.getElementById('button-cancel-'+i).style.display = 'none';
  document.getElementById('mod-tr1').style.display = 'none';
  document.getElementById('mod-tr2').style.display = 'none';
}
</script>
{/literal}

{literal}
<script type="text/javascript">

function setmsg(direction, id) {
  document.getElementById('image_sort_msg').value = direction + '-' + id;  
}

{/literal}
{if $jumpJs!=''}
window.location='#{$jumpJs}';
{/if}

</script>  

{include file='admin.footer.tpl'}
