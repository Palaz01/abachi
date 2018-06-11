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
        <input type="button" name="new_article" id="new_article" value="Új hír" onclick="javascript: document.location='admin.php?mod=articleedit';" class="admin-button" />
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
</table>

<hr />

{if sizeof(length)!=0}
<form action="{$formaction}" method="post" id="form">
  <table class="maingrid">
    <tr>
      <th><input type="checkbox" name="changeall" onclick="javascript: changeAllCheckbox();"></th>            
      <th>Hír címe</th>
      <th>Publikus</th>    
      <th>&nbsp;</th>
      <th>&nbsp;</th>
    </tr>
    {foreach from=$res item=row name=main}
    
      {assign var='tdClass' value='odd'}	
      {if $smarty.foreach.main.index%2==0}{assign var='tdClass' value='even'}{/if}
    
      <tr>
        <td class="{$tdClass}"><input id="id-{$row.id}" type="checkbox" /></td>
        <td class="{$tdClass}">{$row.title}</td>        
        <td class="{$tdClass}">{if $row.public=='0'}Nem{else}Igen{/if}</td>
        <td class="{$tdClass}"><input type="button" name="view{$row.id}" value="Megtekintés" onclick="javascript: popUp('{$row.filename}{#ext#}');" class="admin-button" /></td>
        <td class="{$tdClass}"><input type="button" name="editproject{$row.id}" value="Szerkesztés" onclick="javascript: document.location='admin.php?mod=articleedit&id={$row.id}';" class="admin-button" /></td>
      </tr>    
    {/foreach}
  </table>
</form>
{else}
Nincsenek hírek feltöltve!
{/if}

<table border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td>
      {include file='admin.my.control.navbutton.tpl'}      
    </td>
  </tr>
</table>


{include file='admin.footer.tpl'}


