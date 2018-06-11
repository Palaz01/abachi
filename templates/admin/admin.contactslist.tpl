{include file='admin.header.tpl'}

<center>
<table border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td>
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
      <th>Érkezett</th>
      <th>&nbsp;</th>
    </tr>
    {foreach from=$res item=row name="main"}
    
      {assign var='tdClass' value='odd'}	
      {if $smarty.foreach.main.index%2==0}{assign var='tdClass' value='even'}{/if}
    
      <tr>
        <td class="{$tdClass}"><input id="id-{$row.id}" type="checkbox" /></td>
        <td class="{$tdClass}">{$row.name}</td>
        <td class="{$tdClass}">{$row.arrdate}</td>
        <td class="{$tdClass}"><input type="button" class="admin-button" value="Megtekint" onclick="javascript: document.location='admin.php?mod=contactsview&id={$row.id}';" /> </td>
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

</center>

{include file='admin.footer.tpl'}
