{include file='admin.header.tpl'}

<div class="pageTitle">
  <h3>AutoSEOra jelölt tartalmak</h3>
</div>
<br />

{if sizeof($messages) != 0}
<div class="{$msgClass}">
{$messages}
</div>
{/if}

<center>
<table border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td>
      {include file='admin.my.button.delete.tpl'}      
    </td>
    <td>
      {include file='admin.my.control.sort.tpl'}
    </td>
  </tr>
</table>

<hr />

<form action="{$formaction}" method="post" id="form">
  <table class="maingrid">
    <tr>
      <th><input type="checkbox" name="changeall" onclick="javascript: changeAllCheckbox();"></th>      
      <th>Tartalom címe</th>
	    <th>Időpont</th>
      <th>&nbsp;</th>
    </tr>
    {foreach from=$res item=row name=main}
    
      {assign var='tdClass' value='odd'}	
      {if $smarty.foreach.main.index%2==0}{assign var='tdClass' value='even'}{/if}
    
      <tr>
        <td class="{$tdClass}"><input name="idcb[]" id="id-{$row.id}" type="checkbox" /></td>
        <td class="{$tdClass}">{$row.title}</td>        
		    <td class="{$tdClass}">{$row.instime}</td>
        <td class="{$tdClass}"><input type="button" class="admin-button" name="op" value="Megnyitás" onclick="javascript:popUp('{$row.filename}{#ext#}');" /></td>
      </tr>    
    {/foreach}
  </table>
</form>

<table border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td>
      {include file='admin.my.control.navbutton.tpl'}      
    </td>
  </tr>
</table>

<hr />

<form action="{$formaction}" method="post" name="form" id="form" enctype="multipart/form-data">
<h3>Beállítások</h3>
<table>
  <tr>
    <td valign="top">AutoSEO engedélyezve</td>
    <td>
      <select name="enabled" class="admin-select">
        {html_options options=$enabledOptions selected=$enabled}
      </select>  
    </td>
  </tr>
</table>

<center>
  <input type="hidden" name="cmd" value="st_settings" />
  <input type="submit" class="admin-button" name="store" value="Tárolás" /> &nbsp; &nbsp; &nbsp;  
</center>

</form>

<hr />

<h3>Feldolgozás most</h3>

<center>
  <input type="button" class="admin-button orangeButton" name="runnow" value="Futtatás" onclick="javascript: popUp('./cron.autoseo.php?ci=1');" />
</center>

{include file='admin.footer.tpl'}
