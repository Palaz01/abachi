{include file='admin.header.tpl'}

{if sizeof($messages) != 0}
<div class="{$msgClass}">
{$messages}
</div>
{/if}

<center>
<table border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td>&nbsp;</td>
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
</table>

<hr />

<form action="{$formaction}" method="post" id="form">
  <table class="maingrid">
    <tr>
      <th><input type="checkbox" name="changeall" onclick="javascript: changeAllCheckbox();"></th>            
      <th>Név</th>
	    <th>Hozzászólás</th>
      <th>Dátum</th>
      <th>Termék/tartalom neve</th>
      <th>IP cím</th>
    </tr>
    {foreach from=$res item=row name=main}
    
      {assign var='tdClass' value='odd'}	
      {if $smarty.foreach.main.index%2==0}{assign var='tdClass' value='even'}{/if}
    
      <tr>
        <td class="{$tdClass}"><input id="id-{$row.id}" type="checkbox" /></td>
        <td class="{$tdClass}">{$row.comname|htmlspecialchars}</td>        
		    <td class="{$tdClass}"><textarea rows="5" cols="30">{$row.comtext|htmlspecialchars}</textarea></td>        
        <td class="{$tdClass}">{$row.comdate}</td>        
        <td class="{$tdClass}">{$row.title}</td>                
        <td class="{$tdClass}">{$row.ip}</td>
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


{include file='admin.footer.tpl'}
