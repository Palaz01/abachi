{include file='admin.header.tpl'}

{if sizeof($messages) != 0}
<div class="{$msgClass}">
{$messages}
</div>
{/if}

<center>
<table border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td colspan="2">
      {include file='admin.my.button.autoseo.tpl'}
    </td>
  </tr>
  <tr>
    <td>
      <form>
        <input type="button" name="new_article" id="new_article" value="Új termék" onclick="javascript: document.location='admin.php?mod=productsedit';" class="admin-button" />
      </form>      
    </td>
    <td>
      {include file='admin.my.control.sort.tpl'}
    </td>
  </tr>
  <tr>
    <td>
      {include file='admin.my.button.delete.tpl'}      
    </td>
    <td>
      {include file='admin.my.control.search.tpl'}
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <form action="{$formaction}" method="post">
        Kategóriák:
        <select name="filtercat" id="filtercat" class="admin-select">
          {foreach from=$productCategories item=row key=value}        
            <option value="{$value}">{$row}</option>
          {/foreach}
        </select> 
        <input type="submit" name="filter" value="Szűkítés" class="admin-button" />
        {$hiddens}  
      </form>
      <script>
        $('filtercat').value = '{$filtercat}';
      </script> 
    </td>
  </tr>
</table>

{if sizeof($res)!=0}
<hr />

<form action="{$formaction}" method="post" id="form">
  <table class="maingrid">
    <tr>
      <th><input type="checkbox" name="changeall" onclick="javascript: changeAllCheckbox();"></th>            
      <th>Termék neve</th> 
      <th>Kategóriák</th>
      <th>Nettó ár</th>
      <th>Áfa</th>
      <th>Bruttó ár</th>
      <th>Raktáron</th>
      <th>&nbsp;</th>
      <th>&nbsp;</th>
    </tr>
      {foreach from=$res item=row name=main}
    
        {assign var='tdClass' value='odd'}	
        {if $smarty.foreach.main.index%2==0}{assign var='tdClass' value='even'}{/if}
        
        <tr>
          <td class="{$tdClass}"><input id="id-{$row.id}" type="checkbox" /></td>
          <td class="{$tdClass}">{$row.title}</td>
          <td class="{$tdClass}">{$row.cats}</td>
          <td class="{$tdClass}"><input type="text" style="width: 50px;" value="{$row.price}" id="np-{$row.id}" name="np-{$row.id}" onchange="javascript: checkFields({$row.id});" /> Ft</td>
          <td class="{$tdClass}"><input type="text" style="width: 30px;" value="{$row.vat}" id="vat-{$row.id}" name="vatp-{$row.id}" onchange="javascript: checkFields({$row.id});" /> %</td>
          <td class="{$tdClass}"><span id="fp-{$row.id}">{$row.finalprice}</span> Ft</td>
          <td class="{$tdClass}">{if $row.instock=='1'}Igen{else}Nem{/if}</td>
          <td class="{$tdClass}"><input type="button" name="view{$row.id}" value="Megtekintés" onclick="javascript: popUp('{$row.filename}{#ext#}');" class="admin-button" /></td>
          <td class="{$tdClass}">
            <input type="button" name="editproject{$row.id}" value="Szerkesztés" onclick="javascript: document.location='admin.php?mod=productsedit&id={$row.id}';" class="admin-button" />
            <input type="hidden" name="ch-{$row.id}" id="ch-{$row.id}" value="0" />
          </td>
        </tr>    
        
    {/foreach}
  </table>
</form>
{else}
Nincsenek termékek feltöltve!
{/if}

<center>  
  <input type="button" name="postprices" value="Árak mentése" onclick="javascript: postChanges();" class="admin-button" />
  <form action="{$formaction}" method="post" id="priceform">
    <input type="hidden" name="cmd" value="st_setpricedata" />
    <input type="hidden" name="pricedata" id="pricedata" value="" />
  </form>
</center>

<table border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td>
      {include file='admin.my.control.navbutton.tpl'}      
    </td>
  </tr>
</table>


{literal}
<script type="text/javascript">
function checkFields(id) {
  var pricet=removeChars(document.getElementById('np-'+id).value);
  var vatt=removeChars(document.getElementById('vat-'+id).value);
  document.getElementById('np-'+id).value=pricet;
  document.getElementById('vat-'+id).value=vatt;
  
  var price=parseInt(pricet);
  var vat=parseInt(vatt);
  
  if (isNaN(vat) || isNaN(price)) { 
    return; 
  }
  
  
  
  var finalprice=document.getElementById('fp-'+id);
  
  finalprice.innerHTML = Math.round(price * (1+(vat/100)));
  
  document.getElementById('ch-'+id).value = "1";
}

function removeChars(s) {
  if ((s==null) || (s.length==0)) { return ""; }
  var o="";  
  for (var i=0;i<s.length;i++) {
    var b=s.charCodeAt(i);
    if ((b >= 48) && (b <= 57)) { o += s.charAt(i); }
  }
  return o;
}

function postChanges() {
  var ids = new Array({/literal}{foreach from=$res item=row}{$row.id},{/foreach}{literal}0);
  var out = "";
  var first = true;
  for (var i=0;i<ids.length-1;i++) {
    var id = ids[i];    
    if (id!=0) {
      if (document.getElementById('ch-'+id).value == "1") {
        if (!first) { out += "|"; }
        out += id + "-" + document.getElementById('np-'+id).value + "-" + document.getElementById('vat-'+id).value;
        first = false;
      }
    }
  }
  if (out != "") {
    document.getElementById('pricedata').value = out;
    document.getElementById('priceform').submit();
  }
  else {
    alert ('Nem történt változtatás!');
  }
}
</script>
{/literal}

{include file='admin.footer.tpl'}
