{include file='admin.header.tpl'}

{if sizeof($messages) != 0}
<div class="{$msgClass}">
{$messages}
</div>
{/if}

<center>
{if sizeof($res)!=0}
<table border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td colspan="2">
      {include file='admin.my.button.autoseo.tpl'}
    </td>
  </tr>
  <tr>
    <td>
      {include file='admin.my.control.sort.tpl'}
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
      <th>Oldal címe</th>
      <th>&nbsp;</th>
    </tr>
    {foreach from=$res item=row name=main}
    
      {assign var='tdClass' value='odd'}	
      {if $smarty.foreach.main.index%2==0}{assign var='tdClass' value='even'}{/if}

    
      <tr>
        <td class="{$tdClass}"><input id="id-{$row.id}" type="checkbox" /></td>
        <td class="{$tdClass}">{$row.title}</td>        
        <td class="{$tdClass}"><input type="button" name="editproject{$row.id}" value="Szerkesztés" onclick="javascript: document.location='admin.php?mod=pageedit&id={$row.id}';" class="admin-button" /></td>
      </tr>    
    {/foreach}
  </table>
</form>
{else}
Nincsenek oldalak feltöltve!
{/if}


<table border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td>
      {include file='admin.my.control.navbutton.tpl'}      
    </td>
  </tr>
</table>


{include file='admin.footer.tpl'}


